      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. MI_PROGRAMA01.
       AUTHOR IOGOD.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.
           01 REGISTRO_VISTAS PIC X(20) VALUE "hola soy Bill".
           01 REGISTRO_DOBLE PIC X(20) .
           01 DATO_NUM PIC 9(20) VALUE 0.
           01 DATO_NUM2 PIC 9(20) VALUE 0.
           01 TOTAL PIC 9(20) VALUE 0.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
       add 1 to DATO_NUM.
       move 15 to REGISTRO_VISTAS.
       move 10 to DATO_NUM.
       move DATO_NUM to DATO_NUM2.
       compute TOTAL = DATO_NUM + DATO_NUM2
       DISPLAY "Hello world"
       DISPLAY REGISTRO_VISTAS
       DISPLAY DATO_NUM
       DISPLAY 'total de la suma: ' TOTAL.
       STOP RUN.

      ** add other procedures here
       END PROGRAM MI_PROGRAMA01.
