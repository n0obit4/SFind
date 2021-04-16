<h1 align="center">
  <br>
  <a href="https://github.com/n0obit4/SFind"><img src="https://raw.githubusercontent.com/n0obit4/SFind/master/SFind_logo.png" alt="SFind Logo" border="0" width="180"></a>
  <br>
  SFind
  <br>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Release-v1.0-Red.svg">
  <img src="https://img.shields.io/badge/License-GPL%20v3.0-brightyellow.svg">
  <img src="https://img.shields.io/badge/Platform-Linux-yellow.svg">
</p>

## Introdución

Este es un script que simplemente busca archivos en una carpeta que le indiques y te mostrara cuales archivos son identicos calculando el **hash MD5** para que asi tomes una desicion, ese script nos ha sacado a muchos de mis compañemos de apuros ya que por estar haciendo simples "Backups" paranóicos tendemos a guardar el mismo archivo en multiples carpetas.

## Dependencias

Si quieres instalar las DEPENDENCIAS ejecuta el script **install_requeriments.sh** o instala los paquetes que consideres no tener de forma manual.

  - find
  - md5sum
  - grep
  - cat

### Instalar las dependencias

```bash
$ sudo chmod +x install_requeriments.sh
$ sudo ./install_requeriments.sh
```

## Como usarlo

```bash
$ chmod +x SFind.sh
$ ./SFind.sh DIRECTORIO
```
Donde está **DIRECTORIO** puedes poner el que quieras, teniendo en cuenta que tienes los permisos para realizar dicha tarea.

## Demostración

```bash
$ bash SFind.sh files/
[*]Find Some files in diferent places.
[+] Calculating MD5 hash
[+] Enumerating hashes
[+] Result:

[+]Match #1

920df382ab316eca2d5e57fc5581f577  files/gg_file
920df382ab316eca2d5e57fc5581f577  files/hola/v2/gg_file

[+]Match #2

d41d8cd98f00b204e9800998ecf8427e  files/SIGN_FILE
d41d8cd98f00b204e9800998ecf8427e  files/=

[+]Match #3

7d78f944cd4c6f568320faa48b8a30fa  files/hola/ksjf
7d78f944cd4c6f568320faa48b8a30fa  files/ksjf
```
