# G53SEC
# Authentication

### This Lecture
- Authentication
- Problems with passwords
- Storing passwords
- Cracking passwords
- Two-factor authentication
- Biometrics


### Authentication
- To allow some access to an asset we must ensure:
  - They are permitted to access that asset - *authorisation*
  - They are who they say they are - *identification*

- We can attempt to verify identity using credentials
  - Something they **are**
    - e.g. biometrics - voice, eye, fingerprint
  - Something they **have**
    - e.g. USB key, RSA private key, encrypted file
  - Something they **know**
    - e.g. password, mother's maiden name, DOB


### Usernames and Passwords
- Identification – Who you are (e.g. username)
- Authentication – Verify that identity (e.g. password)
- Authentication should expire
  - E.g. timeouts on websites that log you out periodically.
  - "Remember my credentials" turns this into something you have
    - you have your laptop with that DB on it, so whether you can log in now depends on you having that laptop
    - similar to writing your passwords down and having them on a piece of paper

#### Time of check to time of use – **TOCTTOU**

- Repeated authentication - where you need to log in multiple times
- At the start and during a session
- E.g. Amazon uses cookies to save your basket even when you're logged out.
  - So it keeps your stuff available even when it would have logged you out, but when you actually want to do anything, e.g. make an order, it's only then that you have to re-authenticate.
- The key thing is that there's a gap between the time where the user credentials are checked (e.g. Amazon login) and the time at which they're actually used for something (e.g. verification for Amazon purchase)

- Another example - logging into a computer (time of check), and then some time later trying to access a private file (time of use)
- The question is - has anything changed in terms of security between those two times? Has the user wandered off and left their laptop unattended?


### Passwords
- Passwords are digital keys
  - Simple to implement using existing libraries
  - Demonstrates someone is who they say they are

- Understood by the users (mostly)
- But: In many cases passwords are a terrible way to handle authentication


### Problems With Passwords
- People forget them
- They can be guessed
- Spoofing and Phishing
  - Phishing = emails pretending to be legit people/companies
  - Spoofing = websites pretending to be legit websites
- Compromised password files
  - Data leaks
- Keylogging
  - No point in being secure in any other ways if all your keystrokes are being tracked
- Many of these are made many times worse by weak passwords


### Weak Passwords
- If left to their own devices, people will use terrible passwords
  - Spouse’s name
  - Known dates from their life
  - Small variants on their own name
  - qwerty1234

![](img/weak_passwords2.png)




### Password Policies
- Many companies (and now websites) enforce password policies
  - Certain length, certain types of characters
  - No dictionary words
    - This is silly - having a dictionary word in your password is fine as long as you don't just have dictionary words on their own
  - Change regularly
    - Research has shown that this doesn't improve security at all - most people just increment a counter on the end of their old password.
  - No previously used passwords
    - But you get things like with Steve Bagley - just changes his password a bunch of times to flush out the history and then sets it back to his original one.

#### Problems

- This is not a great solution
  - People attempt to make their life easier by **re-using** passwords
  - When they’re forced to change to unique passwords, they’ll simply change to a slight derivative of the previous password.


### Users Don’t Understand Security

- Google survey a few years ago found this:

![](img/users_dont_understand_security1.png)



### Password Authentication

The bad way:

![](img/password_auth_the_bad_way1.png)

- Bad because the password is being sent around in plaintext, and stored in plaintext. So if the DB gets hacked or the transmission is intercepted, your password is cracked.


### Storing Passwords
- Storing passwords in plain text is a terrible idea
  - You might be hacked
  - Administrators can read them

- Storing encrypted passwords is better, but not perfect
  - Where are the keys stored?
    - They've got to be somewhere, and you can't guarantee in a breach that they're not going to be compromised as well.
  - Administrators can still read them, because they'll have access to the keys.
    - This is a concern because people reuse passwords, so those admins really have access to the users' facebook, amazon, netflix etc. accounts as well.

#### One-Way Hash Function

Using a **one-way hash function** is a much better solution:

![](img/password_auth_one_way_hash_function1.png)

- You still use the username to lookup the user in the DB, but you also hash the password they've entered, and then compare it to a password in the DB that's been hashed using the same hash function.

### Password / Shadow Files

- Operating systems have taken steps to stop people reading hashes for offline attacks
  - Linux stores hashes in a shadow file `/etc/shadow`
  - Windows stores this in `..\system32\config\SAM`

- These files are now **read protected**
- Administrators or people booting another OS will often find a way in


### Password / Data Leaks
- Many security breaches that have exposed users passwords:

  ![](img/big_security_breaches1.png)


### Cracking Passwords
- You can't just reverse the hash, because it's one-way.
- So the main way to do it is hash a load of frequently used passwords, and then compare all of them to the hashed password that's been leaked. If the hashes match, you know what the password is.

- Cracking a password isn’t always illegal, though obviously it sometimes is!
- Password cracking falls into two basic types:
  - **Offline**: You have a copy of the password hash locally
  - **Online**: You do not have the hash, and are instead attempting to gain access to an actual login terminal
- Online is usually attempted with phishing
  - It's harder because you get limits to how many times you can fail to log in to websites, so you can't brute force - need social engineering or to obtain their password through phishing.


### Password Cracking
- Offline password cracking is quite simply a case of trying possible passwords, and seeing if we have a hash collision with a password list
- Might be a **brute force** approach
  - Difficulty is calculated as $\{char\_count\}^{\text{length}}$
  - GPUs are fast, but not fast enough for long passwords

![](img/pass_cracking_difficulty1.png)


### Dictionary Attacks
- Most password cracking is now achieved using **dictionary attacks** rather than brute force
  - Using a dictionary of common words and passwords
  - Apply small variations to this list, trying them all
  - Combine words from two different lists

- `qwerty1234password1` is unbreakable using brute force, but won’t last against a dictionary attack


### Password Strength
Which of these passwords is strongest?

![](img/which_pass_is_strongest.png)



#### Password Strength: Example

What’s the search space?

![](img/pass_strength_example1.png)


#### Example - Improvement
A small improvement?

![](img/pass_strength_example2.png)


### Password Salting
- We can improve security by prepending a random "salt" to a password **before hashing**
- The salt is stored unencrypted with the hash:

![](img/password_salting.png)

- The salt and hash are separated by some delimiter, usually `/` or `$` or something.

### Password Salting

- If we use a different **random salt** for each user, we get the following security benefits:
  1. Cracking multiple passwords is slower – a hit is for a single user, not all users with that password

     - Because 2 people that have the same password w/ different salts, have different hashes, even though they've got the same passwords.
     - So if you have 10,000 users with 10,000 unique salts, your attack will be 10,000 times slower.

     

  2. Prevents **rainbow table** attacks – we can’t pre-compute that many password combinations

     - Rainbow table = where you have a table of a big dictionary of passwords, already hashed, so you just compare each item in a database leak to the hash in that table.

- Salting has no effect on the speed of cracking a single password – so make your passwords good!

  - If you have the salt, then you just prepend that to the passwords in your dictionary list that you're trying, so it still takes the same amount of time for a single password.


### Hashing Speed
- When password cracking, the most important factor is **hashing speed**
- Newer algorithms take longer
  - Partly because they’re more complex
  - But some have been specifically designed to take a while
- Iterate to increase complexity 
  - E.g. PBKDF2 (password based key-derivation function 2)
  - Just iterates a standard hash like SHA-256 or SHA-512 5000 times.
    - This makes authenticating users 5000 times slower, but that's not too bad for a single user. Meanwhile, it takes attackers 5000 times longer for every single password they want to break.
- `bcrypt` is a cipher that can’t be used easily on GPUs
  - it uses too much memory to fit on a single CUDA core.
  - If SHA-512 does 5000 hashes per second, `bcrypt` does 1000 hashes per second.


### If Cracking Fails: Pretexting
- Obtaining private details by offering some "**pretext**" as a reason for needing them
- We continue to rely on email addresses, DOB and Mother’s maiden names as our "last line of defence" for security
  - Usually this is all you need, in combination with a pretext, to get some information you want.
- How much information do we need to ring up a company as someone else?


### Alternatives
- Passwords are something you **know**
  - Anyone who also knows this thing, becomes you

- What about something you **have**?
- Or something you **are**?


### Something You Have
- A key for a lock
- A keycard for a door
- A long password written down

- Again, anyone who obtains this item, becomes you
- Can be used in **combination** with something you know


### Multi-Factor Authentication
- Combines something you **know** with something you **have**
- Common examples:
  - Text codes to mobiles
  - One time passwords, Google Authenticator, Microsoft Authenticator etc.
  - USB devices e.g. Yubico
- New devices and TOCTTOU are a common uses for two-factor authentication
  - So only use MFA when someone is using a new device or needs to do something more dangerous, e.g. Log in w/ cookies to view online bank statement, but require MFA to actually send any money.


### Biometrics
- Measurements of the human body, something you **are**
- Various forms, fingerprint recognition, iris / retina recognition, voice, gait, typing rhythm
- A password you always have with you, but you **can’t change**
- Usually a trade off between **false positives** and **negatives**
