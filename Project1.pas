program Project1;

uses
  crt,sysutils;
var
   A,Z,M,B,Me:array[1..100,1..100] of String;
   hold:String;
   i,iyer1,iyer2,jyer1,jyer2,j,k,l,g,h,N,y,x,d,c,temp,guess2,guess1,predictioncounter,count,ata,playerscore1,playerscore2:integer;
   flag,matching,level,player:byte;
   label cik,randomcik;
begin
  Randomize;
  write('****************************|||||ESLESMELI HAFIZA OYUNU|||||****************************'#13#10'');
  write('Bilgisayarin seviyesini belirleyiniz'#13#10'Baslangic ---> 1'#13#10'Orta ---> 2'#13#10'Ileri ---> 3'#13#10'Profesyonel ---> 4'#13#10'Surpriz ---> 5'#13#10'');
  readln(level);
  write('Boyut ?(6)(8)(10) ');readln(N);
  for i := 1 to N do begin                //her sayıdan ikişer şekilde bir matris yap
    A[1,i] := inttostr(i) ;A[2,i] := A[1,i];A[3,i] := inttostr(i+N);A[4,i] := A[3,i];A[5,i] := inttostr(i+2*N);A[6,i] := A[5,i];
    if (N = 8)OR(N = 10) then
       A[7,i] := inttostr(i+3*N);A[8,i] := A[7,i];
    if N = 10 then
       A[9,i] := inttoStr(i+4*N);A[10,i] := A[9,i];
  end;


  for i := 1 to N do begin                  //Shuffle
    for j := 1 to N do begin
      temp := strtoint(A[i,j]);
      k := random(N)+1;l := random(N)+1;    //random 2 index
      A[i,j] := A[k,l];
      A[k,l] := inttoStr(temp);
    end;
  end;
  for i := 1 to N do begin
    for j := 1 to N do begin
       Z[i,j] := A[i,j];//random karıştırdığım matrisi, Z matrisine ata çünkü oyun bitince ekrana yazdırılıcak.
       M[i,j] := ' ';   //Bilgisayarın hafızasını boş karakterlerle dolduruyoruz.
    end;
  end;delay(2000);
  ClrScr;
  for i := 1 to N do begin
    for j := 1 to N do begin
      B[i,j] := '*';//Oyun esnasında kullanılacak ve oyunculara gösterilecek olan matris B matrisi,bütün hücrelere '*' karakterini atıyoruz
    end;
  end;

  flag :=0;//flag 0 olduğu müddetçe oyun devam edecek.
  player := 1;//ilk başta kullanıcı oynuyor.
  playerscore1 := 0; //Skorları sıfırlıyoruz.
  playerscore2 := playerscore1;
  predictioncounter := 0;//Tahmin sayacı, zorluk seviyelerine göre açılan hücreninin bilgisayar hafızasına atılıp atılmayacağına karar vermemizde yardımcı olacak değişkenimiz.


  while flag = 0 do begin//Oyunun Büyük Döngüsü,bitişini de işaretledim


      if player = 1 then begin

           for i := 1 to N do begin     //seçim yapılacak matris
               if (i = 1) and (N = 6) then writeln('-------------------')
               else if (i = 1) and (N = 8) then writeln('-------------------------')
               else if (i = 1) and (N = 10) then writeln('-------------------------------');
               for j := 1 to N do begin
                   if (j = 1) then write('|',B[i,j]:2,'|')
                   else write(B[i,j]:2, '|');
               end;
               if (N = 6) then writeln(''#13#10'-------------------')
               else if (N = 8) then writeln(''#13#10'-------------------------')
               else if (N = 10) then writeln(''#13#10'-------------------------------');
           end;


           write('-------------------------------Kullanicinin sirasi-------------------------------'#13#10'');

           write('1.Tahmin : Kacinci satir kacinci sutun ');readln(d,c);
           while(A[d,c] = ' ') do begin                                   //Kullanıcıdan gelecek hataları önlemek için döngüler
               writeln('Eslenen ciftlerden birini secemezsiniz,Lutfen tekrar bir hucre seciniz : ');readln(d,c);
           end;
           while(d > N) OR (c > N) do begin
               writeln('Mevcut tahtadan disari ciktiniz,Lutfen tekrar bir hucre seciniz : ');readln(d,c);
           end;
           clrscr;

           guess1 := strtoint(A[d,c]);//guess1'e ata çünkü oyun döngüsü(büyük while döngüsü'nden sonra karşılaştırma var
           B[d,c] := inttostr(guess1);//B ye ata çünkü, seçilen sayı ekrana bastırılıcak(Hatırlarma---B matrisi kullanıcılara gösterilecek matris idi.)
           predictioncounter := predictioncounter + 1 ;

           for i := 1 to N do begin //Kullanıcı tarafından seçilen 1.tahminin ekrana bastırılması
               if (i = 1) and (N = 6) then writeln('-------------------')
               else if (i = 1) and (N = 8) then writeln('-------------------------')
               else if (i = 1) and (N = 10) then writeln('-------------------------------');
               for j := 1 to N do begin
                   if (j = 1) then write('|',B[i,j]:2,'|')
                   else write(B[i,j]:2, '|');
               end;
               if (N = 6) then writeln(''#13#10'-------------------')
               else if (N = 8) then writeln(''#13#10'-------------------------')
               else if (N = 10) then writeln(''#13#10'-------------------------------');
           end;



           write('2. Tahmin : Kacinci satir kacinci sutun ');readln(y,x);clrscr;
           while (y = d) and (x = c) do begin                                                                //Kullanıcıdan gelecek hataları önlemek adına
               writeln('Lutfen secmis oldugunun hucreden farkli bir hucre seciniz : ');readln(y,x);clrscr;
           end;
           while(A[y,x] = ' ') do begin
               writeln('Eslenen ciftlerden birini secemezsiniz,Lutfen tekrar bir hucre seciniz : ');readln(y,x);clrscr;
           end;
           while(y > N) OR (x > N) do begin
               writeln('Mevcut tahtadan disari ciktiniz,Lutfen tekrar bir hucre seciniz : ');readln(y,x);clrscr;
           end;

           guess2 := strtoint(A[y,x]);//guess2'ye atayalım ki, guess1 ile karşılaştırabilelim
           B[y,x] := A[y,x];//B ye atayalımki önceki seçilenle(guess1) birlikte ekrana bastırabilelim.
           predictioncounter := predictioncounter + 1;

           for i := 1 to N do begin     //representing second choosen cell
               if (i = 1) and (N = 6) then writeln('-------------------')
               else if (i = 1) and (N = 8) then writeln('-------------------------')
               else if (i = 1) and (N = 10) then writeln('-------------------------------');
               for j := 1 to N do begin
                   if (j = 1) then write('|',B[i,j]:2,'|')
                   else write(B[i,j]:2, '|');
               end;
               if (N = 6) then writeln(''#13#10'-------------------')
               else if (N = 8) then writeln(''#13#10'-------------------------')
               else if (N = 10) then writeln(''#13#10'-------------------------------');
           end;delay(1000);clrscr;



      end

      //***********************************COMPUTER***********************************AI***********************************
      else if player = 2 then begin


          for i := 1 to N do begin //bilgisayar seçmeden önce oyun ekranı
               if (i = 1) and (N = 6) then writeln('-------------------')
               else if (i = 1) and (N = 8) then writeln('-------------------------')
               else if (i = 1) and (N = 10) then writeln('-------------------------------');
               for j := 1 to N do begin
                   if (j = 1) then write('|',B[i,j]:2,'|')
                   else write(B[i,j]:2, '|');
               end;
               if (N = 6) then writeln(''#13#10'-------------------')
               else if (N = 8) then writeln(''#13#10'-------------------------')
               else if (N = 10) then writeln(''#13#10'-------------------------------');
          end;

          writeln('-------------------------------Bilgisayarin Sirasi-------------------------------');delay(1000);clrscr;

          matching := 1; // default olarak eşleşen var diyerek başlıyoruz.

          {writeln('Bilgisayar tahmin yapmadan once ne var');//oyun ekranında gözükmemeli  //Burası da analiz ederken comment kaldırılıp yazdırılabilir
          for i := 1 to N do begin
              for j := 1 to N do begin
                  write(M[i,j], ' ');
              end;
              writeln();
          end;readln;}

          //default olarak bilgisayarın memory'sini kontrol ediyoruz acaba eşleşen var mı diye?Eğer yoksa random tahmin yapacak bilgisayar

          for i := 1 to N do begin
              for j := 1 to N do begin
                  Me[i,j] := M[i,j];
              end;
          end;

            if matching = 1 then begin //farz edelimki memory de eşleşen çift var
                //Memory'de eşleşen çift varsa, bu çiftler nasıl seçilir???Onun algoritması
                for i := 1 to N do begin
                    for j := 1 to N do begin
                        if(Me[i,j] <> ' ') then begin  //' '(boşluk) karakterine eşit olmayan herhangi bir hücre seçilir|
                            hold := Me[i,j]; //seçilen bu hücre hold değişkenine atanır
                            iyer1 := i;
                            jyer1 := j;
                            Me[iyer1,jyer1] := ' ';// i j de olabilir
                            for k := 1 to N do begin
                                for l := 1 to N do begin
                                    if (Me[k,l] = hold) then begin //sonra bu sa değişkenine eşit bir hücre var mı aranır
                                        iyer2 := k;
                                        jyer2 := l;
                                        Me[iyer2,jyer2] := ' ';
                                        M[iyer1,jyer1] := ' ';
                                        M[iyer2,jyer2] := ' ';

                                        guess1 := strtoint(A[iyer1,jyer1]);//ilk başta seçilen bu 'sa' değişkenine tmp1 atanır
                                        B[iyer1,jyer1] := inttostr(guess1);
                                        //predictioncounter := predictioncounter + 1;
                                        //Burda niye if ler yok burda zaten atadığın gibi sileceksin gerek yok o yüzden
                                        //writeln('Oyun ekrani --- memory de eslesen buldu esin bir tanesini secti');writeln(kount);
                                                               //representing first choosen cell

                                        for g := 1 to N do begin //Bilgisayarın 2.seçtiği hücrenin gösterilmesi
                                            if (g = 1) and (N = 6) then writeln('-------------------')
                                            else if (g = 1) and (N = 8) then writeln('-------------------------')
                                            else if (g = 1) and (N = 10) then writeln('-------------------------------');
                                            for h := 1 to N do begin
                                                if (h = 1) then write('|',B[g,h]:2,'|')
                                                else write(B[g,h]:2, '|');
                                            end;
                                            if (N = 6) then writeln(''#13#10'-------------------')
                                            else if (N = 8) then writeln(''#13#10'-------------------------')
                                            else if (N = 10) then writeln(''#13#10'-------------------------------');
                                        end;writeln('Bilgisayarin 1. tahmini');//readln;beklemek istiyorsak readln commentini kaldırabiliriz
                                        delay(1000);clrscr;

                                        guess2 := strtoint(A[iyer2,jyer2]);
                                        B[iyer2,jyer2] := inttostr(guess2);
                                        //predictioncounter := predictioncounter + 1;

                                        for g := 1 to N do begin //Yapılan 2. tahmini ekrana bastıralım.
                                           if (g = 1) and (N = 6) then writeln('-------------------')
                                           else if (g = 1) and (N = 8) then writeln('-------------------------')
                                           else if (g = 1) and (N = 10) then writeln('-------------------------------');
                                           for h := 1 to N do begin
                                               if (h = 1) then write('|',B[g,h]:2,'|')
                                               else write(B[g,h]:2, '|');
                                           end;
                                           if (N = 6) then writeln(''#13#10'-------------------')
                                           else if (N = 8) then writeln(''#13#10'-------------------------')
                                           else if (N = 10) then writeln(''#13#10'-------------------------------');
                                       end;writeln('Bilgisayarin 2. Tahmini');delay(1000);clrscr;

                                       goto cik;//memory de eşleşen bulamadık, random seçiceğiz
                                    end;
                                end;
                            end;
                        end;
                    end;
                if i = N then matching:=0;//koca tabloyu gezdik i oldu 6 j oldu 6 memory de eşleşen bulamadık
                end;
            end;

            cik:


             if matching = 0 then begin //memory de eşleşen çift yok random seç//1 random seçtin memory de eşleşen var napcan?//2 random seçtin eşleşti sana dönünce sıra seçiceksin
                 d := random(N) + 1;
                 c := random(N) + 1;
                 while(M[d,c] = A[d,c]) do begin   //random üret amma açılanı üretme
                     d := random(N) + 1;
                     c := random(N) + 1;
                 end;
                 while(A[d,c] = ' ') do begin //random üret ama eşleşeni üretme
                     d := random(N) + 1;
                     c := random(N) + 1;
                 end;

                 guess1 := strtoint(A[d,c]);     //bunu random'u aldık, peki ya bu memory'de bir eşleşeni varsa
                 B[d,c] := inttostr(guess1);     //yine bu dursun memory'de eşleşen varsa onu tmp2 yapayım,yoksa 2.random'u üreteyim onu tmp2 yapayım
                 predictioncounter := predictioncounter + 1;

                 //writeln('Oyun ekrani --- random ilk secim');writeln(tahminsayaci);//Oyun ekranında bu bilgiler istenmediği için comment yapılmıştır,analiz yapılırken comment silinebilir.
                 for i := 1 to N do begin//representing second choosen cell
                     if (i = 1) and (N = 6) then writeln('-------------------')
                     else if (i = 1) and (N = 8) then writeln('-------------------------')
                     else if (i = 1) and (N = 10) then writeln('-------------------------------');
                     for j := 1 to N do begin
                         if (j = 1) then write('|',B[i,j]:2,'|')
                         else write(B[i,j]:2, '|');
                     end;
                     if (N = 6) then writeln(''#13#10'-------------------')
                     else if (N = 8) then writeln(''#13#10'-------------------------')
                     else if (N = 10) then writeln(''#13#10'-------------------------------');
                 end;writeln('Bilgisayarin 1. Tahmini');delay(1000);clrscr;


                 //Random seçti sonra baktı ki memory de eşleşen var

                 for i := 1 to N do begin
                     for j := 1 to N do begin
                         Me[i,j] := M[i,j];
                     end;
                 end;

                 for i := 1 to N do begin
                    for j := 1 to N do begin
                        if(Me[i,j] <> ' ') then begin
                           hold := Me[i,j];
                           iyer1 := i;
                           jyer1 := j;
                           Me[iyer1,jyer1] := ' ';// i j de olur
                           for k := 1 to N do begin
                               for l := 1 to N do begin
                                   if (Me[k,l] = hold) then begin
                                      iyer2 := k;
                                      jyer2 := l;
                                      Me[iyer2,jyer2] := ' ';
                                      M[iyer1,jyer1] := ' ';
                                      M[iyer2,jyer2] := ' ';

                                      guess1 := strtoint(A[iyer1,jyer1]);//zaten burda da eşleşen ile aynısını seçmeyi bekliyorum yani
                                      B[iyer1,jyer1] := inttostr(guess1);//yukarıdaki guess1 ile(random üretilen) aynı olanı tekrar seçiyorum,eğer memorydekiyle eşleşmiyorsa buraya uğramayacak zaten
                                      //guess1'i seçtikten sonra oyun ekranını yazdirmaya gerek yok random üretilen de yazdırıldı
                                      //predictioncounter'ı arttırmıyoruz
                                      guess2 := strtoint(A[iyer2,jyer2]);
                                      B[iyer2,jyer2] := inttostr(guess2);
                                      predictioncounter := predictioncounter - 1;//netice de bu da bi predictions, sadece hafızaya atmıyoruz

                                      //writeln('Oyun ekrani --- random ilk secimden sonra eslesen buldu');writeln(kount);
                                      for g := 1 to N do begin //representing second choosen cell
                                          if (g = 1) and (N = 6) then writeln('-------------------')
                                          else if (g = 1) and (N = 8) then writeln('-------------------------')
                                          else if (g = 1) and (N = 10) then writeln('-------------------------------');
                                          for h := 1 to N do begin
                                              if (h = 1) then write('|',B[g,h]:2,'|')
                                              else write(B[g,h]:2, '|');
                                          end;
                                          if (N = 6) then writeln(''#13#10'-------------------')
                                          else if (N = 8) then writeln(''#13#10'-------------------------')
                                          else if (N = 10) then writeln(''#13#10'-------------------------------');
                                      end;writeln('Bilgisayarin 2. Tahmini');delay(1000);clrscr;

                                      matching := 1;

                                      goto randomcik;
                                   end;
                               end;
                           end;
                        end;
                    end;
                    if i = N then matching:=0;//Bilgisayarın memory tablosunu gezdik i oldu 6,j oldu 6 memory de eşleşen bulamadık//flag = 0 neden gerekli?Oyun döngüsündeki en aşağıdaki atamalar için
                end;


                 y := random(N) + 1;
                 x := random(N) + 1;

                 while(M[y,x] = A[y,x]) do begin   //random üret amma açılanı üretme
                     y := random(N) + 1;
                     x := random(N) + 1;
                 end;
                 while (y = d) and (x = c) do begin //az önce ürettiği random sayidan tekrar aynisini uretirse
                     y := random(N) + 1;
                     x := random(N) + 1;
                 end;
                 while(A[y,x] = ' ') do begin //random üret ama eşleşeni üretme
                     y := random(N) + 1;
                     x := random(N) + 1;
                 end;

                 guess2 := strtoint(A[y,x]);
                 B[y,x] := inttostr(guess2);
                 predictioncounter := predictioncounter + 1;

                 //writeln('Oyun ekrani --- random ikinci secim');writeln(kount);     //representing second choosen cell
                 for i := 1 to N do begin     //seçim yapılacak matris
                     if (i = 1) and (N = 6) then writeln('-------------------')
                     else if (i = 1) and (N = 8) then writeln('-------------------------')
                     else if (i = 1) and (N = 10) then writeln('-------------------------------');
                     for j := 1 to N do begin
                         if (j = 1) then write('|',B[i,j]:2,'|')
                         else write(B[i,j]:2, '|');
                     end;
                     if (N = 6) then writeln(''#13#10'-------------------')
                     else if (N = 8) then writeln(''#13#10'-------------------------')
                     else if (N = 10) then writeln(''#13#10'-------------------------------');
                 end;writeln('Bilgisayarin 2. Tahmini');delay(1000);clrscr;


             end;
            randomcik:
      end;





        if(guess1 = guess2) then begin    //Oyun döngüsündeki en aşağıdaki atamalar
            if (player = 1) then begin
                B[y,x] := ' ';//represent edilecek matrisin hücrelerini boşalt
                B[d,c] := ' ';
                A[y,x] := ' ';//random karıştırılmış matrisin eşlenen üyelerini de boşalt//tekrar aynısını seçmemi engelleyecek
                A[d,c] := ' ';
                M[y,x] := ' ';//memory matrisinin de eşleşen hücrelerini sil//zaten eşlenmişse ne gerek var hafızada olmasının
                M[d,c] := ' ';
                player := 1;
                inc(playerscore1);
            end
            else if player = 2 then begin
                if matching = 0 then begin
                   B[y,x] := ' ';//represent edilecek matrisin hücrelerini boşalt
                   B[d,c] := ' ';
                   A[y,x] := ' ';//random karıştırılmış matrisin eşlenen üyelerini de boşalt//tekrar aynısını seçmemi engelleyecek
                   A[d,c] := ' ';
                   M[y,x] := ' ';//memory matrisinin de eşleşen hücrelerini sil//zaten eşlenmişse ne gerek var hafızada olmasının
                   M[d,c] := ' ';
                end
                else if matching = 1 then begin
                    M[iyer1,jyer1] := ' ';
                    M[iyer2,jyer2] := ' ';
                    B[iyer1,jyer1] := ' ';//represent edilecek matrisin hücrelerini boşalt
                    B[iyer2,jyer2] := ' ';
                    A[iyer1,jyer1] := ' ';//random karıştırılmış matrisin eşlenen üyelerini de boşalt//tekrar aynısını seçmemi engelleyecek
                    A[iyer2,jyer2] := ' ';
                end;
                player := 2;
                inc(playerscore2);
              end;


        end

        else if(guess1 <> guess2) then begin //her bir hücrenin üstünün örtülmesi '*' karakteri ile
             if player = 1 then begin




                 B[y,x] := '*';
                 B[d,c] := '*';
                 player := 2
             end
             else if (player = 2) and (matching = 0)then begin















                 B[y,x] := '*';
                 B[d,c] := '*';
                 player := 1;//no change score
             end;
        end;

        {writeln('cover up mi yapacak, eslesenleri silecek mi sonlara dogru yani dongunun icinde');}
        //en son 2 çift kaldığında yazdırmasına gerek yok ama yazdırıyor
        for i := 1 to N do begin     //seçim yapılacak matris
            if (i = 1) and (N = 6) then writeln('-------------------')
            else if (i = 1) and (N = 8) then writeln('-------------------------')
            else if (i = 1) and (N = 10) then writeln('-------------------------------');
                for j := 1 to N do begin
                    if (j = 1) then write('|',B[i,j]:2,'|')
                    else write(B[i,j]:2, '|');
                end;
                if (N = 6) then writeln(''#13#10'-------------------')
                else if (N = 8) then writeln(''#13#10'-------------------------')
                else if (N = 10) then writeln(''#13#10'-------------------------------');
        end;delay(1000);clrscr;

        write('*-*-*-SKOR TABLOSU-*-*-*'#13#10'Kullanici : ' , playerscore1 , ''#13#10'Bilgisayar : ' , playerscore2);writeln;



        count := 0;
        for i := 1 to N do begin       //Bitti mi?
            for j := 1 to N do begin
                if (B[i,j] = ' ') then
                   count := count + 1;
            end;
        end;

        if (playerscore1>((N*N) div 4)) or (playerscore2>((N*N) div 4)) then flag := 1
        else if count = (N*N)then
           flag := 1;
  //BİTTİ DÖNGÜ\\

  end;

  writeln('*******************************GAME OVER*******************************');
  write('Skor Tablosu'#13#10'Oyuncu Insan : ',playerscore1,''#13#10'Oyuncu Bilgisayar : ',playerscore2,''#13#10'');
  if playerscore1 > playerscore2 then writeln('Oyunun kazananı ' , playerscore1 , ' puanla 1.oyuncudur.')
  else if playerscore1 < playerscore2 then writeln('Oyunun kazanani ' , playerscore2 , ' puanla bilgisayardir')
  else writeln('Oyun berabere');

  for i := 1 to N do begin     //seçim yapılacak matris
      if (i = 1) and (N = 6) then writeln('-------------------')
      else if (i = 1) and (N = 8) then writeln('-------------------------')
      else if (i = 1) and (N = 10) then writeln('-------------------------------');
      for j := 1 to N do begin
          if (j = 1) then write('|',Z[i,j]:2,'|')
          else write(Z[i,j]:2, '|');
      end;
      if (N = 6) then writeln(''#13#10'-------------------')
      else if (N = 8) then writeln(''#13#10'-------------------------')
      else if (N = 10) then writeln(''#13#10'-------------------------------');
  end;//delay(10000);

readln;
end.


