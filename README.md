# Berkeley CS 61A Course

This repo contains code written in scheme (inside of the more modern and user-friendly Racket), as part of the Berkeley 61A Computer Science Course. The course contains lectures, homework exercises and follows the book 'Structure and Interpretation of Computer Programs' by Harold Abelson and Gerald Jay Sussman. 
 
### Racket
The original course uses Scheme, based on Lisp, which is an old language and not readily available. I used Racket, which can be used to write Scheme the same as in this course. Additionally, Racket contains a plugin for the berekely scheme structures (words, sentences etc.). The DrRacket IDE is easy to setup and has a good user experience with all the modern features a programmer comes to expect of their IDE: debuggin support, syntax highlighting, and built-in modules for maths, testing, and more.

### Words and Sentences
This course has some custom scheme structures, notably words and sentences. 

### Texbook Exercises
Chapter 1 - The Elements of Programming
Chapter 3 - Formulating Abstractions with Higher-Order Procedures

## Projects

### Project 1 - Twenty One
A scheme implementation of the casino game blackjack, where the aim is to get 21 without going over (or "bust"). This project includes 5 files for the full implementation:
- **twenty-one**: play a single game of blackjack with a given strategy for the user
- **best-total**: required by twenty-one, provides a function for evaluating a hand and returning the best possible value of that hand, taking into account aces.
- **strategies**: provides several different strategies which can be used by the player
- **play**: plays multiple games of blackjack using different strategies and outputs the number of wins minus losses for each one
- **joker**: in the final part, the rules were modified to include 2 joker cards which can have any value from 1 to 11. This file contains an implementation of blackjack using this new rule.

(TODO: Link to docs)

