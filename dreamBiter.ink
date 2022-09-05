# author: AngelCui, JunZhou, HannahZeng
# theme: dark

INCLUDE Dreams/mirrorDream
INCLUDE Dreams/roleplayDream
INCLUDE Dreams/bombDream


VAR dreamCount = 0
VAR optionCount = 2
VAR sanity = 10
VAR currentDream = ""
VAR lastDream = ""
LIST successRecorder =
    (successDreamA),
    (successDreamB),
    (successDreamC),
    (successDreamD)

LIST allDreams = 
    (A), 
    (B), 
    (C), 
    (D)

LIST visitedDreams = (none)

LIST dream_A = (mirrorman), (honesty)

LIST dream_B = (roleplayer), (identity)

LIST dream_C = (student), (manipulation)

LIST dream_D = (sisyphus), (sisyphean)


-> Introduction
=== Introduction ===
That human called Descarte was right––There is no deception of any form in dreams. My ancestry is a dream biter, and they know it well.
    #IMAGE: Images/biter/biterImage1.jpg 
At the last moment before a dream biter dies, they give birth to the predecessor and delivers all knowledge possible. And I am born this moment.
They told me this: For endless ages, our kind's mission is to patrol the manifold plateau of dreams––a marvelous creation of the human brain––and eat them.
While humans call a dream good or bad, wanted or undesirable, and yet for our kind, we have no ethical judgement about our food. (*PRESS RESTART HERE IF AN OPTION IS MISSING; WE ARE SORRY ABOUT THAT.) -> becomingDreamBiter

= becomingDreamBiter
* [Embark on fulfilling my duty.] 
    YOUR SANITY LEVEL IS FULL (10).
    -> Hunt_dream



=== Hunt_dream ===
~ optionCount = 3


{ LIST_COUNT(visitedDreams) < 5:
    { LIST_COUNT(visitedDreams) == 2:
        My first dream visited.
        At this moment, a far voice slips into my mind. It is a word left by my gone ancestry:
        "My child. Congratulations. And yet I have a bad news to deliver."
        "Each and eveyone of our kind would end in either of two ways: perished out of lack of food, or have eaten enough dreams to become one. Choose one out of the two as you go. Best wishes."
        # CLEAR
        I haven't had the time to digest the meaning of this message because it is the time again.
    }
    { LIST_COUNT(visitedDreams) == 4:
        I have encountered 3 dreams, and very close to fulfilling my duty. And that means......
        As my ancestry told me, that means submitting myself to be a haunted dream, like all of my previous generations. What should I do...?
        # CLEAR
        I shake away those thoughts because it is the time again.
    }
    #CELAR
    {~I will never get used to this| Ok, I can do this| Let's go}
    ––Closing my eye, I can sense multiple source of mystery. These sources are dreams exhaled from a dreamer.
    
- else:
    I have finished all my duty. Now it is the time for me to put an end to this. 
    {LIST_COUNT(successRecorder) == 0:
        <>I wouldn't have believed I can successfully consumed all of those dreams.
        -> Endings.endSubmitting
    - else:
        -> Endings.endSubmitting
    }
    
}


//----FOR LOOP----// 
//copy the list to make options

~ temp toChoose = allDreams

- (for)
// take an element off the list to print
~ currentDream = LIST_MIN(toChoose)
~ toChoose -= currentDream

// thread in the choice for this element
<- option(currentDream)


// if there's any left to print, loop
{ toChoose && optionCount > 0: -> for}
-> DONE
//----END FOR LOOP----//

// right after choosing
= option(oneDream) 
{ visitedDreams !? oneDream:
    ~ optionCount--
    + {oneDream==A} [A dream about a humble man.]-> choose(oneDream)
    + {oneDream==B} [A dream about a role-player.]-> choose(oneDream)
    + {oneDream==C} [A dream about a student.]-> choose(oneDream)
    + {oneDream==D} [A dream about a Sisyphus man.]-> choose(oneDream)

    
- else:
    -> DONE
}


// redirect to the chosen dream
= choose(chosenDream)
~ lastDream = chosenDream
I{~ walk into | step into | jump into} it {~ without hesitation| having no idea what's awaiting}. #CLEAR
~ visitedDreams += chosenDream

{LIST_VALUE(chosenDream) == 1: -> Enter_badDream.dreamA } 

{LIST_VALUE(chosenDream) == 2: -> Enter_badDream.dreamB } 
    
{LIST_VALUE(chosenDream) == 3: -> Enter_badDream.dreamC } 
    
{LIST_VALUE(chosenDream) == 4: -> Enter_badDream.dreamD } 
    

    

=== Enter_badDream ===
= dreamA

    -> mirrorDream
    
= dreamAEnd
    {successRecorder !? successDreamA:
        -> Eat_dream
    -  else:
        -> Lose_dream
    }
    
= dreamB

    -> rolePlayDream
    
= dreamBEnd
    {successRecorder !? successDreamB:
        -> Eat_dream
    -  else:
        -> Lose_dream
    }
    
= dreamC

    -> bombDream
    
= dreamCEnd
    {successRecorder !? successDreamC:
        -> Eat_dream
    -  else:
        -> Lose_dream
    }
    
= dreamD
    ~ successRecorder -= successDreamD
    this dream isn't completed durig the jam.
    -> Eat_dream



=== Lose_dream ===
~ sanity -= 4
YOUR SANITY LEVEL DECREASE TO {sanity}.

{sanity < 0:
    YOU PERISHES AS YOUR ENERGY CAN NO LONGER SUSTAIN YOU. THE NEXT GENERATION OF DREAM BITER WILL BE HERE TO REPLACE YOUR POSITION.
    -> Endings.endDying
- else:
    I can feel that my sanity is withering.{~ I was so close.| Did I just failed?| This doesn't feel very good.| I need to consume a dream soon, otherwise...}
    -> Hunt_dream
}



=== Eat_dream ===
~ sanity += 3
YOUR SANITY LEVEL RESTORE TO {sanity}.

-> choose
= choose
+   [Go on to the next dream] 
    -> Hunt_dream
+   [Ruminate the dream I just ate] 
    -> Ruminate_dream.thought(lastDream)


=== Ruminate_dream ===

= thought(this)

From this <>
{LIST_VALUE(this):
-   1: {dream_A(1)}
-   2: {dream_B(1)}
-   3: {dream_C(1)}
-   4: {dream_D(1)}

}<>'s dream, I suddenly {~ gain more curiosity about the concept | feel I just saw the concretization of the idea of} "<>
{LIST_VALUE(this):
-   1: {dream_A(2)}
-   2: {dream_B(2)}
-   3: {dream_C(2)}
-   4: {dream_D(2)}

}<>".

-> Eat_dream.choose



=== Endings ===
= endSubmitting
Is this is the end? Am I turning into a haunted dream? I can now join my ancestry.
# IMAGE: Images/biter/biterImage2.png
*   [...] I didn't have a choice. And I knew it from the beginning.
    **  [...] But those dreams––are really good food. I had some good nights: {dreamManager()}
        *** [...] The next dream biter––if there were one––hear my sorrow and please fulfill my wish: 
            CONSUME ME, please.
            # RESTART
            -> END

=endDying
Now here I am, dying due to underachieveness
But who says this is neccessarily worse? {dreamManager()}
Still, I tried.
The rest of our kind's duty, however, should be carried on: 
*   [Give birth to the next generation.] "My child, let me tell you: you are a dream biter."
# RESTART
-> END

=== function dreamManager
    There are  
    {LIST_COUNT(successRecorder) > 0:
        <>still {LIST_COUNT(successRecorder)} dreams that I didn't help at all.
    - else:
        <>no dreams that I couldn't comprehend and consume.
    }
    


