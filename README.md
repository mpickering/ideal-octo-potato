Compile with `ghc -O2 Main.hs -hidir dist -odir dist -DBAD`

* `-DBAD` uses `-funfolding-use-threshold=136`
* `-DGOOD` uses `-funfolding-use-threshold=140`

```
[matt@nixos:~/random/repro]$ ghc -O2 Main.hs -hidir dist -odir dist -DBAD && ./Main
....
CInt: 2.96 ms
```

```
[matt@nixos:~/random/repro]$ ghc -O2 Main.hs -hidir dist -odir dist -DGOOD && ./Main
...
CInt: 1.59 ms
```

