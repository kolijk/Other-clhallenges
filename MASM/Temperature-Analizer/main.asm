includelib msvcrt.lib
includelib ucrt.lib
includelib legacy_stdio_definitions.lib

extern scanf : proc
extern printf : proc
extern exit : proc

.data
    format db "%s", 0
    txt1 db "Highest temperature: %d", 10, 0
    txt2 db "Sum temperature: %d", 10, 0
    temperatury dd 90, 95, 121, 88, 11
    suma dd 0
    highestTemp dd 0

.code

main PROC
    sub RSP, 40

    mov RCX, 5
    
    LEA RBX, temperatury

    petla:
        
        MOV EAX, [RBX]
        ADD suma, EAX

        CMP highestTemp, EAX
        JA run1
        MOV highestTemp, EAX

        run1:

        ADD RBX, 4
        
        SUB RCX, 1
        CMP RCX, 0
        JNE petla
         


        LEA RCX, txt1
        MOV EDX, [highestTemp]
        call printf
        

        LEA RCX, txt2
        MOV EDX, [suma]
        call printf


    MOV ECX, 0
    call exit

main ENDP

END
