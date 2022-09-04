VAR dreamCount = 0
VAR optionCount = 3
VAR sanity = 10
//VAR chaos = 0
VAR currentDream = ""
LIST successRecorder =
    successDreamA,
    successDreamB,
    successDreamc,
    successDreamD,
    successDreamE,
    successDreamF
    
LIST allDreams = 
    (A), 
    (B), 
    (C), 
    (D), 
    (E), 
    (F)

LIST visitedDreams = (none)

LIST dream_A = (mirrorman), (ism)

LIST dream_B = (dreamer_B), (ism)

LIST dream_C = (dreamer_C), (ism)

LIST dream_D = (dreamer_D), (ism)

LIST dream_E = (dreamer_F), (ism)


-> testroom
=== testroom ===


-> Introduction
=== Introduction ===
I am a dream biter, which I learnt as of today. -> becomingDreamBiter

= becomingDreamBiter
* [Accept the duty.] I accept the duty of a dream biter, but not the fate of it. -> Hunt_dream



=== Hunt_dream ===
~ optionCount = 3

{ LIST_COUNT(visitedDreams) < 11:
    {~I will never get used to this| Ok, I can do this| Let's go}––Closing my eye, I can sense multiple source of mystery. These sources are dreams exhaled from a dreamer.
    //{dreamManager()}
- else:
    I have finished all my duty. Now it is the time for me to put an end to this.
    -> Endings.endSubmitting
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
    + [{oneDream}] I{~ walk into | step into | jump into} {oneDream} {~ without hesitation| having no idea what's awaiting}. #CLEAR
    -> choose(oneDream)
- else:
    -> DONE
}


// redirect to the chosen dream
= choose(chosenDream)
~ visitedDreams += chosenDream

{LIST_VALUE(chosenDream) == 1: -> Enter_badDream.dreamA } 

{LIST_VALUE(chosenDream) == 2: -> Enter_badDream.dreamB } 
    
{LIST_VALUE(chosenDream) == 3: -> Enter_badDream.dreamC } 
    
{LIST_VALUE(chosenDream) == 4: -> Enter_badDream.dreamD } 
    
{LIST_VALUE(chosenDream) == 5: -> Enter_badDream.dreamE } 

    

=== Enter_badDream ===
= dreamA
    This is a dream of a {LIST_MIN(dream_A)}.
    INCLUDE Dreams/mirrorDream
    {successRecorder !? successDreamA:
        -> Eat_dream
    -  else:
        -> Lose_dream
    }
    
= dreamB
    This dream is about a {LIST_MIN(dream_B)}.
    ...
    -> Eat_dream
= dreamC
    This dream is about a {LIST_MIN(dream_C)}.
    ...
    -> Eat_dream
= dreamD
    This dream is about a {LIST_MIN(dream_D)}.
    ...
    -> Eat_dream
= dreamE
    This dream is about a {LIST_MIN(dream_E)}.
    ...
    -> Eat_dream

    //fallback

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
+   [Go on to the next dream] 
    -> Hunt_dream
+   [Ruminate the dream I just ate] 
    -> Ruminate_dream.thought(currentDream)


=== Ruminate_dream ===

= thought(this)
From this <>
{LIST_VALUE(this):
-   1: {dream_A(1)}
-   2: {dream_B(1)}
-   3: {dream_C(1)}
-   4: {dream_D(1)}
-   5: {dream_E(1)}
}<>'s dream, I suddenly {~ understand | comprehend | feel akin to the idea of} <>
{LIST_VALUE(this):
-   1: {dream_A(2)}
-   2: {dream_B(2)}
-   3: {dream_C(2)}
-   4: {dream_D(2)}
-   5: {dream_E(2)}
}<>.

-> Eat_dream



=== Endings ===
= endSubmitting
I have had enough of all this endless cycle. 

*   [...] This has been my wish at the very beginning. I don't want to be the fuel of horrible dreams, like my predecessors.
    **  [...] And I have nothing of regret.
        *** [...]
            **** [...?]
Wait...I can no longer exit my duty, or this existence! Part of me is so deeply embedded in my own horrible dream. Who can help me? Who can kill me at justice?
The next dream biter––if there were one––hear my sorrow and please fulfill my wish: 

CONSUME ME, please.

# RESTART
-> END

=endDying
I did had some good dream visits://让玩家回忆之前经历的dream

# RESTART
-> END


=== function dreamManager
    There are still {LIST_COUNT(allDreams)} dreams on my duty.
    



