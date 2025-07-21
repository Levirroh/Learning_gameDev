ini_open("save.ini");

if (ini_key_exists("pontos", "score")) {
    record = ini_read_real("pontos", "score", 0); 
} else {
    record = 0;
}

ini_close();