includelib msvcrt.lib
includelib ucrt.lib
includelib legacy_stdio_definitions.lib

extern scanf : proc
extern printf : proc
extern exit : proc

.data
    format db "%s", 0
    txt dq 100 DUP(0)
    result db 0

.code

main PROC
    sub RSP, 40

    LEA RCX, format
    LEA RDX, txt
    call scanf
    
    LEA RBX, txt

    petla:
    
        MOV AL, [RBX]
        test AL, AL
        JZ koniec

        MOV AL, [RBX]

        CMP AL, 'a'
        JB dalej
        CMP AL, 'z'
        JA dalej
        AND AL, 0DFh
        JMP dalej2

        dalej:
        OR AL, 20h

        dalej2:
        MOV [RBX], AL
        INC RBX
        
        JMP petla

    koniec:

    LEA RCX, format
    LEA RDX, txt
    call printf

    MOV ECX, 0
    call exit

main ENDP

END
