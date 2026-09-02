# Cryptography Basics

Cryptographies ultimate purpose is to ensure secure communication in the presence of adversaries. 
Some examples of regulation the require crytography are PCI DSS for payment card data and GDPR.

## Plaintext to Ciphertext

* Plaintext is the original readable message or data.
* Ciphertext is the unreadable version of the message or data
* Cipher is an algorithm to convert plaintext to ciphertext.
* Key is a string of bits the cipher uses to encrypt or decrypt data.
* Encryption of the process of converting plaintext to ciphertext.
* Decryption is the reverse of encryption.

## Historical Ciphers

One of the simplest historic ciphers is the **Caesar Cipher** from the first century BCE. It worked by shifting the alphabet by a number of places (the key). For example with a key of 3, a would become d, b would become e, etc.

## Types of Encryption

The two main types of encryption are **Symmetric** and **Asymmetric**.

### Symmetric Encryption

Symmetric encryption uses the same key to encrypt and decrypt the data. The issue is transferring the key securely between users.

* DES was adopted as a standard in 1977 and uses a 56-bit key. With the advancement in computing power, in 1999, a DES key was successfully broken in less than 24 hours, motivating the shift to 3DES.
* 3DES is DES applied three times; consequently, the key size is 168 bits, though the effective security is 112 bits. 3DES was more of an -hoc solution when DES was no longer considered secure. 3DES was deprecated in 2019 and should be replaced by AES; however, it may still be found in some legacy systems.
* AES was adopted as a standard in 2001. Its key size can be 128, 192, or 256 bits.

### Asymmetric Encryption

Asymmetric encryption uses two different keys, one to encrypt (the public key) and one to decrypt the data (the private key).

## Basic Math

Here I'll cover two operations that are used in various algorithms:

* XOR operation
* Modulo operation

### XOR Operation

In binary, XOR (exclusive OR), compares two bits and returns 1 if they are different and 0 if they are the same. This operation is often represented by the symbol ⊕ or ^.

Say for example we want to apply XOR to the binary numbers 1010 and 1100, we would go bit by bit: 1^1=0, 0^1=1, 1^0=1,0^0=0, resulting in 0110.

XOR is useful for a few reasons, it is commutative and associative, and applying XOR to a value with itself results in 0, and applying XOR to any value with 0 returns itself.

### Modulo Operation

The Modulo operator (% or mod), X%Y is the **remainder** when X is divided by Y.

The important thing to remember with Modulo is that it is not reversible.



 
