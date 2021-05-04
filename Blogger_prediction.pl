degree(high).
degree(medium).
degree(low).
caprice(left).
caprice(middle).
caprice(right).
topic(impression).
topic(political).
topic(tourism).
topic(scientific).
topic(news).
lmt(yes).
lmt(no).
lpss(yes).
lpss(no).

predict(A,B,C,D,E,Z) :-  check_degree(A,B,C,D,E,Z).
check_degree(A,B,C,D,E,Z):- (A\='low',check_caprice(B,C,D,E,Z));(A='low',check_topic(C,D,Z)).

check_topic(C,D,Z):- (C='tourism',write("Predicted Blogger Type is:"),nl,Z = "NO");
                     (C='news',write("Predicted Blogger Type is:"),nl,Z = "NO");
                     (C='scientific',write("Predicted Blogger Type is:"),nl,Z = "NO");
                     (C='impression',check_lmt(D,Z));(C='political',check_lmt(D,Z)).

check_lmt(D,Z):- (D='yes',write("Predicted Blogger Type is:"),nl,Z = "NO");
                 (D='no',write("Predicted Blogger Type is:"),nl,Z = "YES").

check_caprice(B,C,D,E,Z):-(B='right',check_r_topic(C,D,E,Z));(B\='right',check_c_topic(C,Z)).

check_c_topic(C,Z):-(C='scientific',write("Predicted Blogger Type is:"),nl,Z = "NO");
                    (C\='scientific',write("Predicted Blogger Type is:"),nl,Z = "YES").

check_r_topic(C,D,E,Z):- (C='impression',write("Predicted Blogger Type is:"),nl,Z = "NO");
                         (C='news',write("Predicted Blogger Type is:"),nl,Z = "NO");
                         (C='scientific',write("Predicted Blogger Type is:"),nl,Z = "NO");
                         (C='tourism',check_t_lmt(C,D,E,Z));(C='political',check_t_lmt(C,D,E,Z)).

check_t_lmt(C,D,E,Z):-(D='yes',check_l_topic(C,E,Z));
                      (D='no',write("Predicted Blogger Type is:"),nl,Z = "NO").

check_l_topic(C,E,Z):-(C='tourism',check_lpss(E,Z));(C\='tourism',check_lpss(E,Z)).

check_lpss(E,Z):- (E='yes',write("Predicted Blogger Type is:"),nl,Z = "YES");
                  (E='no',write("Predicted Blogger Type is:"),nl,Z = "YES").

start():-
    write('Instuctions:'),nl,
    write('Use only small letter(case sensitive)'),nl,
    write('Give Command *predict(degree,caprice,topic,lmt,lpss,Prediction)*'),nl,
    write('EX:'),nl,
    write('predict(high,left,news,yes,yes,Z).'),nl,
    write('Z(Blogger type) is the predicted value.').
