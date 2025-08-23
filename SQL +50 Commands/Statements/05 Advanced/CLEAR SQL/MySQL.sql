-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

-- Foro https://stackoverflow.com/questions/8807836/how-to-clear-mysql-screen-console-in-windows

-- Limpiar la pantalla en la consola MySQL en Linux
-- Usa el siguiente comando para limpiar la pantalla:
\! printf '\033c'

-- Alternativamente, puedes usar:
-- \! sh -c "printf '\033c'"
-- \! sh -c "echo -e '\033[H\033[2J'"
-- \! echo -e '\033[H\033[2J'
-- system clear;
-- \! clear

-- Limpiar la pantalla en la consola MySQL en Windows
-- Para limpiar la pantalla, utiliza:
\! cls
-- O bien, puedes usar:
-- system cls;
