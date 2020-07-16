## Sound, Music & Machine Learning: 58+1 Indices On The Body:


### Iteration 1: First Piece and Venice Performance

This project grew in dialogue with another ongoing project titled 58+1 Indices on the body. That project is a collaboration between the artistic collective AMAE and the artist Pier Giorgio De Pinto and philosopher Jean-luc Nancy. This project focuses on Nancy's 58 indices sur le corps (58 indices on the body), written in 2006 by Jean-Luc Nancy presented in his book Corpus. The project combines performances, videos, interactive installations and collaborations with a large and varied group of artists.

As part of this project Jean Luc Nancy recorded himself reading his 58 indices on the body, he also wrote an additional index specifically for the project. The project presented here grew out of a collaboration with AMAE, Pier Giorgio De Pinto and Jean Luc Nancy in which I originally set some of these indices to music in 2015. The result was a piece that we were invited to present during the Helicotrema festival at the Francois Pinault Foundation in Venice alongside La Biennale events taking place throughout the city.


[AMAE/De Pinto w/Jean-Luc Nancy & Stephen Roddy at Helicotrema 2015](http://helicotrema.blauerhase.com/helicotrema-2015/)


You can hear that piece here:
<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=1061781095/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/artwork=small/track=570375840/transparent=true/" seamless><a href="http://stephenroddy.bandcamp.com/album/le-son-du-corps-et-un-corps-de-sons">Le Son Du Corps Et Un Corps de Sons by Stephen Roddy feat. Jean-Luc Nancy, AMAE &amp; DePinto)</a></iframe>

* [21, 7 & 3 (feat. Jean-Luc Nancy, Amae & DePinto)](https://stephenroddy.bandcamp.com/track/21-7-3-feat-jean-luc-nancy-amae-depinto)


<img src="images/12186271_1116088238416382_7289188895621671914_o.jpg?raw=true"/><br/>

### Iteration 2: Further Pieces

Later, in 2016/2017, I recorded additional Soundworks and musical pieces incorporating Nancy's indexes, a portion of which will be set to performances and recorded by video artists as part of the 63 Videos on the Body project. You can hear those pieces here on my collection"Le Son Du Corps Et Un Corps de Sons" available on:

<iframe style="border: 0; width: 350px; height: 470px;" src="https://bandcamp.com/EmbeddedPlayer/album=1061781095/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/transparent=true/" seamless><a href="http://stephenroddy.bandcamp.com/album/le-son-du-corps-et-un-corps-de-sons">Le Son Du Corps Et Un Corps de Sons by Stephen Roddy feat. Jean-Luc Nancy, AMAE &amp; DePinto)</a></iframe>

* [Spotify](https://open.spotify.com/album/3DsDLwlP74rKzIRaGvsyeh)
* [Apple Music](https://music.apple.com/us/album/le-son-du-corps-et-un-corps-de-sons/1314413365)

### Iterations 3 & 4: Language, Translations & Machine Learning

In 2019/2020 I developed an art installation to be delivered via web application for the 2020 edition of [NIME: The International Conference on New Interfaces for Musical Expression](https://nime2020.bcu.ac.uk/). This installation was entitled 'Indices Online'. An earlier version of the project was installed for the [2019 Irish Sound Science and Technology Event at the Cork School of Music](https://drive.google.com/file/d/1W_np9Jb-QEeny_Hd4wzR12Zvv-CdpXFr/view). That piece was titled: 58+1 Indices On The Body: A Reflection on Translations through Language, Technology and Sounds - Selected Indices Soundworks and Musical Pieces w/Sentiment Analysis.

It collects together and iterates upon all of my sonic/musical work for the project to date. The audience is invited to listen to the pieces, and reflect on the indices which have been translated into English from Nancy's native French by Richard A. Rand for the English translation of Nancy's Corpus for the Perspectives in Continental Philosophy Series.

The text is also analysed using a machine learning model for sentiment analysis [implemented in ml5.js](https://ml5js.org/). This analysis returns a value on a scale of 0 (negative) to 1 (positive). This sentiment is reflected in the color of the waveform that is drawn across on the screen. The shape of the waveform represents the amplitude values of the recording while at a given time, while its colour represents the sentiment value assigned to the translated text.

<img src="images/ind_image.png?raw=true"/><br/>


The piece is a reflection on translations across languages, vocalisation, and technologies.
The original indices were written in French. Jean-luc Nancy's reading of them reveals a new layer of meaning through his use of prosody and intonation.
We are presented with English translations of the text that must to some degree reflect the choices and interpretations of the translator.
The sentiment analysis introduces an additional layer of meaning/distortion. It does not always represent the translated text very well and rarely represents the information conveyed in Nancy's vocalisations in the original French. The colours chosen to reflect the sentiment values introduce further culturally conditioned ideas about sentiment and emotion.
The original sentiment analysis model is also quite crude. Drawing from the ml5.js reference file:

>Sentiment is a model trained to predict the sentiment of any given text. The default model, currently 'moviereviews', is trained using IMDB reviews that have been truncated to a maximum of 200 words, only the 20000 most used words in the reviews are used.

>his model, ported from tensorflowJS, scores the sentiment of text with a value between 0 ("negative") and 1 ("positive").

Source: [Sentiment() reference](https://ml5js.org/reference/api-Sentiment/)

This introduces yet another layer of distortion where the sentiment of a section of translated text is interpreted in relation to patterns derived from 200 word movie reviews and the complex phenomenon of sentiment is then classified along a simple linear scale from 0-1.

The use of sonic and musical materials to frame the texts introduces yet another layer of distortion. The soundworlds evoked do not always match the indices, sometimes they are built around the ebb and flow of Nancy's vocalisations as he reads. Sometimes around the text. Other times they seem completely random.

Rarely are the original text, the spoken words, the english translation, the sound, and sentiment analysis in harmony with one another.

This discordant configuration however is in perfect harmony with Nancy's vision of the human body as expressed in his indices. As Nancy comments in index 46:

>Why indices? Because there's no totality to the body, no synthetic unity. There are pieces, zones, fragments. There's one bit after another, a stomach, an eyelash, a thumb-nail, a shoulder, a breast, a nose, an upper intestine, a choledoch, a pancreas: anatomy is endless, until eventually running into an exhaustive enumeration of cells. But this doesn't yield a totality...

### Directions

   1. Follow link for the Desktop version: [Desktop](https://stephenroddy.github.io/58IndicesLangTrans/)

   2. Follow link for the Mobile version:: [Mobile](https://stephenroddy.github.io/58IndicesLangTrans/mobile.html)

   3. Wait for the page to load.

   4. Press 'Play Index' to hear a random index, view the waveform and see the translation.

   5. Press 'Play Index' again for another one. All but one of the audio files is associated to an index.

### Creative Skills
Sound Design. Music Composition. Sound Art. Visual Design.

### Technical
Javascript. HTML. CSS. Git.Sentiment Analysis. Machine Learning Knowledge. Creative Coding. Audio Recording and Engineering.Web Development.

### Tags
Indices on the Body. Pier De Pinto. AMAE. Jean-Luc Nancy. Stephen Roddy. Sound. Music. Contemporary Art.
