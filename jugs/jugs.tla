-------------------------------- MODULE jugs --------------------------------
EXTENDS Integers
VARIABLE BigJug, SmallJug
CONSTANTS BigCapacity, SmallCapacity
-------
Init == (BigJug = 0) /\ (SmallJug = 0)
CurrentTotal == BigJug + SmallJug
-------
FillBig ==
    /\ BigJug' = BigCapacity
    /\ SmallJug' = SmallJug
-------
FillSmall ==
   /\ SmallJug' = SmallCapacity
   /\ BigJug' = BigJug
-------
DumpBig ==
    /\ BigJug' = 0
    /\ SmallJug' = SmallJug
-------
DumpSmall ==
    /\ SmallJug' = 0
    /\ BigJug' = BigJug
-------
SmallToBig == 
    \/
        /\ (CurrentTotal >= BigCapacity)
        /\ (BigJug' = BigCapacity)
        /\ (SmallJug' = CurrentTotal - BigCapacity)
    \/
        /\ (CurrentTotal < BigCapacity)
        /\ (BigJug' = CurrentTotal)
        /\ (SmallJug' = 0)
-------
BigToSmall ==
    \/
        /\ (CurrentTotal >= SmallCapacity)
        /\ (SmallJug' = SmallCapacity)
        /\ (BigJug' = CurrentTotal - SmallCapacity)
    \/
        /\ (CurrentTotal < SmallCapacity)
        /\ (SmallJug' = CurrentTotal)
        /\ (BigJug' = 0)
-------
Next ==
    \/ FillBig
    \/ FillSmall
    \/ DumpBig
    \/ DumpSmall
    \/ SmallToBig
    \/ BigToSmall
------
TypeOk == (SmallJug <= SmallCapacity) /\ (BigJug <= BigCapacity)
=============================================================================
\* Modification History
\* Last modified Fri Aug 10 01:08:33 MSK 2018 by magniff
\* Created Thu Aug 09 22:15:43 MSK 2018 by magniff
