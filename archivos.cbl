      *****************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           select arc-lectura assign to '../lectura.txt'
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS estado.
           select arc-lectura2 assign to '../lectura2.txt'
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS estado3.
           select arc-escritura assign to '../escritura.txt'
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS estado2.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD arc-lectura
       RECORDING MODE IS F.
       01 heraldo.
           05 identi PIC 99.
           05 nombre PIC X(6).
           05 apellido PIC X(10).
           05 sueldo PIC 9(4).
       FD arc-lectura2
       RECORDING MODE IS F.
       01 heraldo2.
           05 identi PIC 99.
           05 medalla PIC X(9).
           05 mmr PIC 9(4).
           05 favorito PIC X(7).
       FD arc-escritura
       RECORDING MODE IS F.
       01 inmortal.
           05 identi PIC 99.
           05 nombre PIC X(6).
           05 apellido PIC X(10).
           05 sueldo PIC 9(9).
           05 medalla PIC X(9).
           05 mmr PIC 9(4).
      *-----------------------
       WORKING-STORAGE SECTION.
       01 estado PIC X(2).
           88 positivo value '00' '97'.
       01 estado2 PIC X(2).
           88 positivo2 value '00'.
       01 estado3 PIC X(2).
           88 positivo3 value '00' '97'.
       01 WS-READFIN PIC X(1) value 'N'.
       01 WS-KEY1 PIC 99.
       01 WS-KEY2 PIC 99.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
           PERFORM 1000-COMIENZO
           PERFORM 2000-PROCESO UNTIL WS-READFIN = 'S'
           PERFORM 3000-FINALISIMA
           STOP RUN.
       1000-COMIENZO.
           OPEN INPUT arc-lectura arc-lectura2
                OUTPUT arc-escritura.
           IF NOT positivo or NOT positivo2 or NOT positivo3 then
               display 'estado: 'estado
               display 'estado2: 'estado2
               display 'estado2: 'estado3
               PERFORM 3000-FINALISIMA
           END-IF.
           PERFORM 2025-LEER-INPUT.
           PERFORM 2028-LEER-INPUT2.
       2000-PROCESO.
      *    perform 2025-LEER-INPUT.
      *    perform 2028-LEER-INPUT2.
      *    move nombre of heraldo to nombre of inmortal.
      *    move apellido of heraldo to apellido of inmortal.
      *    move sueldo of heraldo to sueldo of inmortal.
           EVALUATE TRUE
               WHEN WS-KEY1 = WS-KEY2
                   display "son iguales"WS-KEY1
                   display "son iguales"WS-KEY2
                   move identi of heraldo to identi of inmortal
                   move nombre of heraldo to nombre of inmortal
                   move apellido of heraldo to apellido of inmortal
                   move sueldo of heraldo to sueldo of inmortal
                   move medalla of heraldo2 to medalla of inmortal
                   move mmr of heraldo2 to mmr of inmortal
                   PERFORM 2030-GRABAR-OUTPUT
                   PERFORM 2025-LEER-INPUT
                   PERFORM 2028-LEER-INPUT2
               WHEN WS-KEY1 < WS-KEY2
                   display "menor mata"
                   PERFORM 2025-LEER-INPUT
               WHEN WS-KEY1 > WS-KEY2
                   display "oportunidad"
                   PERFORM 2028-LEER-INPUT2
           END-EVALUATE.
      *    compute sueldo of heraldo =
      *    sueldo of heraldo + (sueldo of heraldo*0.10).
      *    move heraldo to inmortal
      *    perform 2030-GRABAR-OUTPUT.


       3000-FINALISIMA.
           CLOSE arc-lectura arc-lectura2 arc-escritura.
           DISPLAY "parrafo final".
           STOP RUN.

       2025-LEER-INPUT.
           READ arc-lectura
               AT END
                   display 'termino: 'heraldo
                   display estado
                   move 'S' to WS-READFIN
               NOT AT END
                   display 'registro: 'heraldo
                   move identi of heraldo to WS-KEY1

           END-READ.
           if not positivo then
              display 'estado: 'estado
              PERFORM 3000-FINALISIMA
           END-IF.

       2028-LEER-INPUT2.
           READ arc-lectura2
               AT END
                   display estado3
                   move HIGH-VALUE to WS-KEY2
               NOT AT END
                   display 'registro2: 'heraldo2
                   move identi of heraldo2 to WS-KEY2
           END-READ.
           IF NOT positivo3 AND estado3 not = '10' then
               display 'estado: 'estado
               PERFORM 3000-FINALISIMA
           END-IF.
       2030-GRABAR-OUTPUT.
           write inmortal.
           if not positivo2 then
               display estado2
               PERFORM 3000-FINALISIMA
           END-IF.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
