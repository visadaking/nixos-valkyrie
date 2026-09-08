# nixos-valkyrie

my config for NixOS, opinionated, foss oriented, security, programming, gaming ready.

(just look through the code already instead of reading this lol)

made for medium to higher end AMD systems


why nixos?

bit more:

learning NixOS, moved from fedora and arch, because I wanted something more reproducible and under my control and nix fits this exactly like how i want it to be.  


naming reason?

why i named this valkyrie? in norse mythology, valkyries guide souls to valhalla, where the einherjar (warriors) train and prepare for the cataclysmic events of Ragnarök,

so i thought it was cool, plus i think this is badass.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

last updated - 09/09/2026

credits: daniel fullmer and NixOS wiki and NixOS discord server

thanks to rond for hosting my config for NixOS on his git :D


NOTE: please do not try this configuration on a system with nvidia gpu/intel gpu, please make sure that you have your own modules for nvidia/intel.

---

## valkyrie terminal aliases

lazy shit for managing valkyrie without typing everything every time

```text
v          = nvim
v-edit     = edit valkyrie
v-check    = check the flake
v-dry      = test the rebuild
v-switch   = switch to valkyrie
v-clean    = clean old nix generations
v-backup   = push valkyrie to both git remotes
```

---

## hardware

this repo contains a placeholder hardware-configuration.nix.

for a new machine, generate your own hardware configuration first.

```text
nixos-generate-config
```

then replace the hardware-configuration.nix in this repo with the generated one.
