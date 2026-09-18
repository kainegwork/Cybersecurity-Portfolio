# Cryptography Basics

Cryptography is used to protect data and communications from unauthorised access or modification.

It supports security goals such as confidentiality, integrity and authentication and is widely used in systems that handle sensitive information.

## Plaintext and Ciphertext

- **Plaintext** is the original readable data.
- **Ciphertext** is the encrypted, unreadable form of that data.
- A **cipher** is an algorithm used to encrypt or decrypt data.
- A **key** is a value used by the cipher during encryption or decryption.
- **Encryption** converts plaintext into ciphertext.
- **Decryption** converts ciphertext back into plaintext.

## Historical Ciphers

One of the simplest historical ciphers is the **Caesar cipher**.

It works by shifting letters by a fixed number of places in the alphabet.

For example, with a shift of 3:

```text
A → D
B → E
C → F
```

This is useful for understanding the basic idea of a key-controlled transformation, although it is not secure by modern standards.

## Types of Encryption

The two main categories are **symmetric** and **asymmetric** encryption.

### Symmetric Encryption

Symmetric encryption uses the same secret key to encrypt and decrypt data.

Its main challenge is securely sharing the key between the parties that need it.

Examples include:

- **DES** — an older 56-bit cipher that is no longer considered secure.
- **3DES** — applies DES multiple times and was used as a transitional replacement for DES.
- **AES** — a modern symmetric cipher that supports 128-, 192- and 256-bit keys.

### Asymmetric Encryption

Asymmetric encryption uses a pair of mathematically related keys:

- **Public key** — can be shared.
- **Private key** — must remain secret.

Depending on the algorithm and use case, the keys can support encryption, digital signatures or key exchange.

Asymmetric cryptography is also widely used with TLS and public-key infrastructure.

## XOR

The XOR operation compares two bits and returns:

- `1` if the bits are different.
- `0` if the bits are the same.

Example:

```text
1010
1100
----
0110
```

Useful properties include:

- XOR is commutative.
- XOR is associative.
- A value XORed with itself gives 0.
- A value XORed with 0 remains unchanged.

These properties make XOR useful in many cryptographic constructions.

## Modulo

The modulo operator gives the remainder after division.

For example:

```text
17 mod 5 = 2
```

Modular arithmetic is important in several cryptographic systems, particularly public-key algorithms.
