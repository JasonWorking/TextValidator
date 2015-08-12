TextValidator
=============

A simple class cluster for Text Validators in iOS, such as Email address, Chinese mobile phone number, etc...


### Usage 

1. Download source files
2. Drop JKTextValidator.h/m to your project.
3. Alloc a validator and checkText. 

```
	JKTextValidator *validator = [JKTextValidator bankCardValidator];
    BOOL isValid = [validator checkText:@"123456789012"];

```