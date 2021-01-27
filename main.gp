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

vigenere_decrypt(c,k,n) = vector(#c,i,(c[i] - k[(i-1) % #k + 1] + n) % n);

text=encode(text);
dechiffre = vigenere_decrypt(text,k,27);
clair = decode(dechiffre);

print(clair);
