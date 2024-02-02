# Declaration
%{
#include <stdio.h>
%}
# Rule section 
%%

[a-zA-Z]+   { printf("WORD: %s\n", yytext); }
[.,;:?!]    { printf("PUNCTUATION: %s\n", yytext); }
[ \t\n]+    /* Ignore whitespace */
.           { printf("UNPRECEDENTED: %s\n", yytext); }
%%
# User subroutines 
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
# Explanation:
# yylex() - this is the main flex function
#           which runs the Rule Section
# yytext is the text in the buffer
# The yywrap function is used by Flex to determine what should happen when the end of the input file is reached
# [ \t\n\r]+: This rule matches one or more whitespace characters
# (space, tab, newline, carriage return) and does nothing, effectively ignoring them.






Explanation
The lexer produced from your Flex (Lex) specification file, exercise.l, is designed to analyze input text (English sentences) and categorize its various elements into different classes according to the rules outlined in the Flex script. Here's a detailed explanation of the lexer's functionality:

Tokenization: The lexer systematically processes the input text, examining each character individually and striving to find matches with the rules specified in the Flex script.

Classification of Tokens: Depending on the input characters and the rules specified, the lexer classifies the input into the following categories:

Words: Any sequence of one or more alphabetical characters (letters) will be classified as a word. It prints "Word: " followed by the word itself.
Numbers: Any sequence of one or more numerical digits (0-9) will be classified as a number. It prints "Number: " followed by the number itself.
Punctuation: Characters like '.', ',', '!', and '?' are classified as punctuation. It prints "Punctuation: " followed by the punctuation character.
Other: Any character that doesn't match the above categories is classified as "Other." It prints "Other: " followed by the character itself.
Output: As the lexer processes the input, it prints the classification of each token along with the token itself. For example, if you input the sentence "This game is lit.", the lexer will produce the following output:

word:This    
word:game
word:is
word:lit



The outlined lexer serves as a fundamental tool for text analysis, categorizing content into words, numbers, punctuation, and other elements according to predefined rules. It plays a crucial role in constructing parsers and compilers, contributing to the processing and comprehension of textual data.
