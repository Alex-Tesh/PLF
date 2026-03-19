# PLF

Made by: Teșulă Alexandru, Ioniță Ștefania Georgiana, Rujoiu Denisa, Șoltuz Rareș-Florin

# 🐺🐐🥬 Tema 2 — Lupul, Capra și Varza
> **Programare Logică și Funcțională** · SWI-Prolog

---

## 📖 Despre problemă

Un țăran trebuie să traverseze un râu împreună cu un **lup**, o **capră** și o **varză**.
Barca poate transporta **țăranul și cel mult un element** odată.

Lăsate nesupravegheate, apar două pericole:

- 🐺 **Lupul** mănâncă capra dacă sunt singuri pe același mal
- 🐐 **Capra** mănâncă varza dacă sunt singure pe același mal

**Scopul:** să se găsească o secvență de traversări care mută totul în siguranță
de pe malul stâng pe malul drept.

---

## ⚙️ Cum a fost rezolvată

### 1. Reprezentarea stării

Fiecare configurație a sistemului este descrisă printr-o structură cu 4 argumente
care reține poziția fiecărei entități: Țăran, Lup, Capră, Varză.
Fiecare valoare poate fi `stg` (malul stâng) sau `dr` (malul drept).

| Stare | Reprezentare |
|---|---|
| Inițială | Toți pe malul stâng |
| Finală | Toți pe malul drept |

---

### 2. Validarea stării

Se definesc explicit stările **invalide** (periculoase), iar o stare este considerată
validă prin **negație ca eșec** — dacă nu poate fi demonstrată ca invalidă, atunci este sigură.

Cele două configurații interzise sunt:
- Lupul și capra singuri pe același mal, fără țăran
- Capra și varza singure pe același mal, fără țăran

---

### 3. Mutările posibile

Există exact **4 traversări legale** pe care le poate face țăranul:

- Traversează **singur**
- Traversează **cu lupul**
- Traversează **cu capra**
- Traversează **cu varza**

Condiția că țăranul și entitatea transportată sunt pe același mal este impusă
**implicit prin unificare** — nu sunt necesare verificări suplimentare.

---

### 4. Algoritmul de căutare — DFS

Soluția este găsită printr-un **DFS (Depth-First Search)** cu detectarea stărilor vizitate.

DFS este ales deoarece **Prolog funcționează nativ prin backtracking** — același
mecanism pe care îl folosește DFS. Pentru spațiul mic de stări al acestei probleme
(maxim **16 combinații posibile**), este extrem de eficient.

O listă de stări **Vizitate** previne buclele infinite, garantând terminarea algoritmului.

---

## ▶️ Cum rulezi programul

Deschide fișierul în [SWISH](https://swish.swi-prolog.org) sau în SWI-Prolog local
și execută interogarea `joaca.`

Programul va afișa pas cu pas poziția fiecărei entități pe cele două maluri,
de la starea inițială până la mutarea completă pe malul drept.

---

## 📁 Structura proiectului

```
projectPLF.swinb
│
├── p1 — opus/2               (maluri opuse)
├── p2 — invalid/1, valid/1   (validarea stării)
├── p3 — mutare/2             (generarea mutărilor)
├── p4 — rezolva/3, solutie/1 (algoritmul DFS)
└── p5 — joaca/0              (afișarea soluției)
```

V
