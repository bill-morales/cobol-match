      ******************************************************************
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
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.
       01 EMPLEADO.
         05 NOM PIC X(20) VALUE "bill".
         05 APE PIC X(20) VALUE "morales davila".
         05 SUELDO PIC 9(4)V99 VALUE 2.50.
       66 TOTALEMP RENAMES NOM THRU SUELDO.
       01 EMPLEADO2 REDEFINES EMPLEADO PIC X(80).




      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
      **

      * The main procedure of the program
      **
            DISPLAY TOTALEMP
            STOP RUN.



      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
