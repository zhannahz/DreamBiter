INCLUDE Folder/mirrorDream.ink


VAR dreamCount = 0
VAR optionCount = 3
VAR sanity = 10
VAR chaos = 0
VAR currentDream = ""
LIST allDreams = 
    (A), 
    (B), 
    (C), 
    (D), 
    (E), 
    (F),
    (G),
    (H),
    (I),
    (J)

LIST visitedDreams = (none)

LIST dream_A = (capitalist), (liberalism)

LIST dream_B = (paranoid), (scepticism)

LIST dream_C = (painter), (sensualism)

LIST dream_D = (governor), (utilist)

LIST dream_E = (architect), (idealism)

LIST dream_F = (worker), (practicalism)

LIST dream_G = (killer), (nihilism)

LIST dream_H = (writer), (nomadism)

LIST dream_I = (homeless), (materialism)

LIST dream_J = (scientist), (experimentalism)


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
    -> Endings
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

{LIST_VALUE(chosenDream) == 6: -> Enter_badDream.dreamF } 

{LIST_VALUE(chosenDream) == 7: -> Enter_badDream.dreamG } 

{LIST_VALUE(chosenDream) == 8: -> Enter_badDream.dreamH } 

{LIST_VALUE(chosenDream) == 9: -> Enter_badDream.dreamI } 

{LIST_VALUE(chosenDream) == 10: -> Enter_badDream.dreamJ } 
    

=== Enter_badDream ===
= dreamA
    This is a dream of a {LIST_MIN(dream_A)}.
    ... 
    -> Eat_dream
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
= dreamF
    This dream is about a {LIST_MIN(dream_F)}.
    ...
    -> Eat_dream
= dreamG
    This dream is about a {LIST_MIN(dream_G)}.
    ...
    -> Eat_dream
= dreamH
    This dream is about a {LIST_MIN(dream_H)}.
    ...
    -> Eat_dream
= dreamI
    This dream is about a {LIST_MIN(dream_I)}.
    ...
    -> Eat_dream
= dreamJ
    This dream is about a {LIST_MIN(dream_J)}.
    ...
    -> Eat_dream
    //fallback


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
-   6: {dream_F(1)}
-   7: {dream_G(1)}
-   8: {dream_H(1)}
-   9: {dream_I(1)}
-   10: {dream_J(1)}
}<>'s dream, I suddenly {~ understand | comprehend | feel akin to the idea of} <>
{LIST_VALUE(this):
-   1: {dream_A(2)}
-   2: {dream_B(2)}
-   3: {dream_C(2)}
-   4: {dream_D(2)}
-   5: {dream_E(2)}
-   6: {dream_F(2)}
-   7: {dream_G(2)}
-   8: {dream_H(2)}
-   9: {dream_I(2)}
-   10: {dream_J(2)}
}<>.

-> Eat_dream



=== Endings ===
<>I have had enough of all this endless cycle. 
-> end1

= end1
*   [...] This has been my wish at the very beginning. I don't want to be the fuel of horrible dreams, like my predecessors.
    **  [...] And I have nothing of regret.
        *** [...]
            **** [...?]
Wait...I can no longer exit my duty, or this existence! Part of me is so deeply embedded in my own horrible dream. Who can help me? Who can kill me at justice?
The next dream biter––if there were one––hear my sorrow and please fulfill my wish: 

CONSUME ME, please.

# RESTART
-> END

=end2
-> END


=== function dreamManager
    There are still {LIST_COUNT(allDreams)} dreams on my duty.
    



