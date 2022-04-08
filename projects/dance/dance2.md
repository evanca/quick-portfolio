## Dance Projects

### Project at a Glance
In 2016 I was commissioned to collaborate on a dance piece entitled Fógraím/I Proclaim with dancer/choreographer Sibéal Davitt and writer Tristan Rosenstock for 'Embodied at the GPO'. This was a series of six new dance solos by Irish-based female choreographers that were performed inside the GPO to mark the role played by Women the 1916 rising. The pieces were commissioned by An Post's 'GPO Witness History' and the Dublin Dance Festival.

<img src="images/2.jpg?raw=true"/><br/>


### Design Goal:
Create an automated music system for live performance that reacts to a dancer's performance by creating music and visuals.
Debut the system during 5 performances from April 18-24 2016.

### Research Questions:
1. How should movement be captured?
2. How should movement and sound interact?
3. What should be automated and what should be controlled by a performer?

### Research Methodology
I used a mixed methods approach with a research-driven iterative design methodology. Research-driven co-design methodologies allowed stakeholders to provide input to the design process.

### Research Overview
My schedule involved 3 research and development of work followed by 2 weeks of production.

<img src="images/research2.png?raw=true"/><br/>

### Detailed Schedule
#### Week 1:
Literature Review:
  - Get a sense of similar work undertaken previously.

Stakeholder Interviews.
  - Multiple Stakeholders:
      - Audience.
      - Performers.
      - Production Company.
      - Festival.
      - Venue.
Full day of interviews.

Discovery Workshop with Performers
  - Understand what the system needs to do.

Empathy Workshop with Performers.
  - Understand the users needs.

Began rapid prototyping.

#### Week 2:

##### Monday - Wednesday
- Mornings: User testing for prototype.
- Afternoons: Critique Workshop.
- Evenings: Analysing User testing & Workshop data.
          Implementing new design insights.

##### Thursday:
Focus Group & Critique Workshop:
- Feedback from Production Company.
- Feedback from Venue.
- Feedback from other performers.

##### Friday:
Critique workshop:
- Work in progress presented to public audience.
- Feedback from Audience members.
- Survey provided to audience.

Survey:
  - Quantitative online survey w/ video of prototype from workshop.

#### Week 3:
##### Monday - Wednesday.
Mornings:
- User testing for prototype.
Afternoons:
- Critique Workshop.
Evenings:
- Analysing User testing, Online Survey & Workshop data.
  - Implementing new design insights.

##### Thursday
Focus Group:
- User testing of prototype during focus group.

##### Friday:
- Implementing final prototype changes.

### Results: Key Insights
- A. Performers want to control exactly what music plays and when.
- B. Performers want the system to be invisible and intelligent, not detracting from their performance.
- C. Audiences respond to obvious links between physcial movement and musical sounds.
- D. Audiences respond to musical sounds more positively than non-musical sounds.

### Results: Design Impact
A: Data captured from performers determined what music would play.
- A1. Final prototype only plays musical cues when performers produce specific actions.
- A2. Initial prototype always generated music regardless of actions.

B: Installed the sensors into the set.
- B1. Final prototype used allocentric piezoelectric sensors to detect movement and location data.
- B2. Initial prototype used egocentric accelerometer/gyroscope/magnetometer sensors worn by performers.

C: Music designed to sound like it was being created by the performers movements on stage.
- C1. Final prototype made clear link between movements and sounds.
- C2. Initial prototypes did not have clear link between movement and sound.

D: Used musical cues rather than sound effects.
- D1. Final prototype made heavy use of music with little sound effects.
- D2. Intial porototype made heavier use of sound effects.

### Detailed Overview: Fógraím / I Proclaim
#### Iteration 1
For this project I developed an interactive music performance system that fulfilled a number of important roles in the overall production. It captured sounds produced by the dance from a series of microphones and piezoelectric sensors placed in an allocentric configuration around the stage. This audio was then processed live and inserted into the music. The audio signal was further analysed using FFT analysis and the amplitudes across different frequency bands were used to both drive and control different parameters of the musical piece.
The system also allowed me to improvise musical elements live each night while incorporating further musical elements that had been composed prior to the performance. To further enrich the performance I developed a generative music component. This would would react to the audio signals from the mics and to the music I was performing live by generating musical materials (novel melodies and harmonic content) to reflect and support the dance at different points in a performance. The overall result is a vibrant and dynamic musical soundscape that reacts in real-time to the sounds created by the dancer.

Sound Design & Musical extracts from the performance:

- [Morse Radio](/audio/Radio.mp3)
- [Saoirse](/audio/Saoirse 3.mp3)
- [Céim](/audio/Ceim.mp3)

<img src="images/flyer.jpeg?raw=true"/><br/>

### Research & Development Process
In developing this system I used a participatory design methodology that allowed the choreographer and writer participate in the system design. We began this process three months before the initial rehearsals. This processes involved the team members getting together in the studio to work out some ideas. We used both the CoisCéim dance studio and the Dance Ireland studios. At the start of a session I would explore some questions: Given our vision for the overall production what should the role of the music performance system be?  How should it integrate into the production? What should the music sound like aesthetically for the different sequences of the dance? I would then use rapid prototyping techniques to create a prototype system that we could test there and then in the session. Based on the feedback of the other team members I would either scrap an idea or flesh it out more fully. We had sessions where presented our production to the other performers who were taking part in the event and additional sessions where we showed our work to other choreographers and artists. These were invaluable in providing additional feedback for the overall production and provided especially useful information for my development process.

### Performances & Press
The performances ran from the 20th-22nd of April and sold out each night and was well received in the press. The production was well received in the press:

- [Irish Times Review](https://www.irishtimes.com/culture/stage/bodily-autonomy-and-inequality-women-dance-around-the-proclamation-1.2609030)
- [Examiner Review](/files/examiner.pdf)
- [TN2 Review](https://www.tn2magazine.ie/embodied-review/)

### Iteration 2: The 'Hear This Dance' System
In 2017 I was commissioned to work on a second project that expanded on Fógraím/I Proclaim during a residency in Dance Ireland. The piece was entitled 'Hear this Dance'. The team this time around included Sibéal Davitt covering choreography and dance, Niall Vallely on concertina and myself. The goal this time around was to expand on the system I created for the GPO shows to perform and new piece. This new system needed to support a second musician and expand on their performance. It also had to allow the dancer to record and loop her steps. These loops could then be used as musical materials in the piece. My updated system accounted for these new additions and also allowed me greater control over the musical content generated.

<img src="images/hear-this-dance-1.jpg?raw=true"/><br/>

### Research & Development Process
I used a similar participatory design process as before. I would present a prototype to my collaborators during a session and incorporate their feedback and ideas using rapid prototyping techniques. I gained more general audience feedback through public showings we did in June and September as well as more informal feedback sessions with colleagues and friends.

<iframe width="560" height="315" src="https://www.youtube.com/embed/WWRnM_9cv9E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


- [Announcement](https://www.danceireland.ie/whats-on/events/dance-ireland-residency-sibeal-davitt-3)
- [Showing](https://www.danceireland.ie/whats-on/events/new-movements-sibeal-davitt/)
- [Connect Coverage](https://connectcentre.ie/news/stephen-roddy-work-dance-ireland/)

### Creative Skills
Sound Design. Music Composition & Performance. Live Electronic Music performance. Generative Music.

### Technical
Live Audio. Recording. Sound Synthesis & Audio DSP. Python. OSC & MIDI protocols. Audio Engineering.

### Tags
Dance, Technology, Fógraím / I Proclaim, Hear This Dance, Live Music, Embodied At The GPO, Generative Music.


<!--

### Hear This Dance: Project Overview



### Hear This Dance

#### Project Overview
thanks to the success of the Forgraim/ Project I was in

<img src="images/hear-this-dance-1.jpg?raw=true"/><br/>



It also allowed a performer to improvise live alongside the dancer. All three nights of the performance were sold out and it attracted positive reviews in the national and local press with the Examiner describing our performance as “a raw, rhythmic, primal yet playful performance that is searingly powerful and a sheer joy to behold”. The success of this piece led to a residency at Dance House in 2018 in which Sibéal and myself worked with traditional concertina player Niall Vallely to further develop the system to incorporate a traditional instrumentalist.


### Press


In developing this system I used a participatory design methodology



While working on the project we also had the opportunity to showcase our work to the other members of the dance company  



s and dance studios and





#### Hear This Dance

Choreography: Sibéal Davitt

Concertina: Niall Vallely

Composer: Stephen Roddy



I began my research process 3 month ahead of our first rehearsal.

My first prototype for this project utilised the accelerometer, gyroscope and compass native to the iPhone 5 to directly control musical parameters. This rendered the While working on this system I found causal link between body movements and sonic results to be too direct. this made the relationship between physical movement and sonic effect quite predictable and boring so I decided to change my approach and focus on the sounds created by the dancer.



#### Legitimate Bodies



  prototyped a system






 and reprocesses this


 roles in the overall production. Firstly it allowed me


captures
-->
