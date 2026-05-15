includelib msvcrt.lib
includelib ucrt.lib
includelib legacy_stdio_definitions.lib

extern scanf : proc
extern printf : proc
extern exit : proc

.data
    formatS db "%s", 0
    formatC db "%c", 0
    textEntered db 100 DUP(0)
    lengthTextEntered dq 100

.code

main PROC
    sub RSP, 40

    LEA RCX, formatS
    LEA RDX, textEntered
    call scanf
    
    LEA RBP, textEntered    ;Ustaw wskaźnik RBP na poczatek zmiennej textEntered
    XOR RAX, RAX            ;Wyzeruj rejestr RAX
    anyway:
    CMP BYTE PTR [RBP], 0   ;Sprawdz czy wskaznik wskazuje na 00
    JZ skip                 ;Jeżeli wskazuje wskaźnik na 00
    INC RBP                 ;Dodaj 1 do wskaźnika RBP
    ADD RAX, 1              ;Dodaj 1 do rejestru RAX (counter) jedynkę
    JNZ anyway              ;Jeżeli RBP nie wskazuje na 00

    skip:
    MOV lengthTextEntered, RAX

    LEA RBP, textEntered        ; Do wskaźnika RBP umieszczam adres początku zmiennej textEntered
    ADD RBP, lengthTextEntered  ;Przesuwam wskaznik o ilosc bajtow wprowadzonych
    SUB RBP, 1                  ;Cofam wskaznik o 1 aby byl na ostatnim znaku
    MOV R12, lengthTextEntered  ; Do rejestru R12 umieszczam wartosc dlugosc tekstu

    anyway1:

    MOV BYTE PTR[RBP + 1], 0    ;Zamieniam bajt na pozycji offset + 1 na bajt 0

    LEA RCX, formatS
    LEA RDX, [RBP]
    call printf

    CMP R12, 0  ;Sprawdzam czy rejestr R12 (counter dla aktualnej liczby znakow)
    JE skip2    ;Jezeli R12 jest równe 0
    DEC RBP     ;Zmniejsz o 1 adres wskaznik RBP
    SUB R12, 1  ;Odejmij z rejestru R12 jedynkę
    JNE anyway1 ;Jezeli R12 nie jest równe 0

    skip2:

    MOV ECX, 0
    call exit

main ENDP

END
