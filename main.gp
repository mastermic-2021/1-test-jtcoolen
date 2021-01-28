str2ascii(s)=Vec(Vecsmall(s));
ascii2str(v)=strchr(v);
encode(s) = {
  [ if(c==32,0,c-96) | c <- str2ascii(s), c==32 || 97<=c && c<= 122 ];
}
decode(v) = {
  ascii2str([ if(c==0,32,c+96) | c <- v]);
}
text=readstr("input.txt")[1];
k=encode("haricot");

\\ Solution basée sur l'exemple du cours.
\\ On initialise un vecteur de la longueur du chiffré,
\\ dont la composante i correspond à Chiffré[i] - Clé[(i % #Chiffré)] mod #Alphabet.
\\ En effet, le chiffre de Vigenère est une variante du chiffre de
\\ César; chaque lettre possède son propre décalage donné par la lettre
\\ de la clé d'indice i mod #Chiffré.

\\ Note : i vaut 1 pour la première composante et #c pour la dernière.

\\ Arguments : c, le chiffré en tant que vecteur encodé via une fonction d'encodage;
\\ k, un vecteur représentant la clé encodée par le biais de encode;
\\ n, la longueur de l'alphabet considéré.
\\ Retourne un vecteur contenant le déchiffré sous forme de vecteur encodé.
vigenere_decrypt(c, k, n) = vector(#c, i, (c[i] - k[(i - 1) % #k + 1]) % n);

text = encode(text);
dechiffre = vigenere_decrypt(text, k, 27);
clair = decode(dechiffre);

print(clair);
