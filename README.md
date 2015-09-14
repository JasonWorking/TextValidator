TextValidator
=============

A simple class cluster for Text Validators in iOS, such as Email address, Chinese mobile phone number, etc...


###Install 

	`pod 'JKTextValidator', '~> 1.0.2'`


 Alloc a validator and checkText. 

```
	JKTextValidator *validator = [JKTextValidator bankCardValidator];
    BOOL isValid = [validator checkText:@"123456789012"];

```
