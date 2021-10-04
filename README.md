Compile with `ghc -O2 Main.hs`


The good case, with unfolding-use-threshold=140 in Main.hs

```
[nix-shell:~/random/repro]$ ghc -O2 Main.hs
[1 of 9] Compiling Bench            ( Bench.hs, Bench.o )
[2 of 9] Compiling System.Random.GFinite ( System/Random/GFinite.hs, System/Random/GFinite.o )
[3 of 9] Compiling System.Random.SplitMix.Init ( System/Random/SplitMix/Init.hs, System/Random/SplitMix/Init.o )
[4 of 9] Compiling System.Random.SplitMix ( System/Random/SplitMix.hs, System/Random/SplitMix.o )
[5 of 9] Compiling System.Random.SplitMix32 ( System/Random/SplitMix32.hs, System/Random/SplitMix32.o )
[6 of 9] Compiling System.Random.Internal ( System/Random/Internal.hs, System/Random/Internal.o )
[7 of 9] Compiling System.Random    ( System/Random.hs, System/Random.o )
[8 of 9] Compiling System.Random.Stateful ( System/Random/Stateful.hs, System/Random/Stateful.o )
[9 of 9] Compiling Main             ( Main.hs, Main.o )
Linking Main ...

[nix-shell:~/random/repro]$ ./Main
CInt: 1.59 ms
```

