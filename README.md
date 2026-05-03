# Claude Meta-Skills

J'ai testé 47 skills Claude. 8 ont changé ma façon de travailler.

Ce ne sont pas des outils pour une tâche précise. Ce sont des **améliorations de la façon dont Claude pense** — chaque conversation devient plus nette, plus rapide et plus utile. À installer une fois, à utiliser partout, sur n'importe quel sujet.

<!-- screenshot: Image principale — un split montrant un texte IA brut à gauche et le même texte humanisé à droite. Ou un collage de 4 outputs (une présentation, un wizard de décision, un rapport de fact-check, un prompt). Fichier suggéré : docs/images/hero.png -->

---

## Ce que vous obtenez

| Skill | Comment l'utiliser | Ce qu'elle fait |
|-------|-------------------|-----------------|
| `/humanizer` | `/humanizer [collez votre texte]` | Supprime les tournures robotiques. Le texte sonne comme vous. |
| `/fact-checker` | `/fact-checker [collez votre article]` | Vérifie chaque affirmation. Signale ce qui est faux, périmé ou invérifiable. |
| `/prompt-master` | `/prompt-master [vos idées en vrac]` | Transforme des pensées désorganisées en prompt structuré pour n'importe quel outil IA. |
| `/process-interviewer` | `/process-interviewer [ce que vous voulez créer]` | Pose les bonnes questions avant de construire quoi que ce soit. Évite des heures de corrections. |
| `/decision-toolkit` | `/decision-toolkit [votre décision]` | Cadre en 9 angles pour les grandes décisions. Vous guide — ne décide pas à votre place. |
| `/frontend-slides` | `/frontend-slides [votre sujet ou fichier]` | Crée une présentation animée dans votre navigateur. Un seul fichier, aucune installation. |
| `/find-skills` | `/find-skills [ce que vous voulez faire]` | Cherche parmi 90 000+ skills communautaires avant de construire depuis zéro. |
| `/mcp-builder` | `/mcp-builder [lien vers une doc API]` | Connecte Claude à n'importe quel logiciel qui a une API. Pour les profils plus techniques. |

---

## Comment installer

> **Quelle version de Claude utilisez-vous ?**
> - Application bureau ou terminal → suivez les instructions **Claude Code**
> - Navigateur sur claude.ai → suivez les instructions **Claude.ai**

---

### Claude Code (application bureau ou terminal)

**Option A — Installer les 8 skills en une seule commande** *(Mac/Linux)*

Ouvrez un terminal et collez :

```bash
curl -s https://raw.githubusercontent.com/Chappygo-OS/claude-meta-skills/main/install.sh | bash
```

Relancez Claude Code. Vos skills sont prêtes.

<!-- screenshot : Terminal montrant la commande d'installation qui se termine avec succès. Fichier suggéré : docs/images/install-terminal.png -->

**Option B — Installer uniquement les skills dont vous avez besoin**

```bash
git clone https://github.com/Chappygo-OS/claude-meta-skills.git
```

Copiez ensuite le dossier de la skill souhaitée :
```bash
cp -r claude-meta-skills/skills/humanizer ~/.claude/skills/
```

> **Windows** : copiez le dossier dans `C:\Users\VotreNom\.claude\skills\`

**Comment utiliser une skill après installation :**

Tapez `/` suivi du nom de la skill dans n'importe quelle conversation Claude — ex. `/humanizer`.

<!-- screenshot : Interface Claude Code avec le sélecteur de commandes `/` ouvert et les skills installées listées. Fichier suggéré : docs/images/slash-command-picker.png -->

---

### Claude.ai (navigateur web)

Ces skills sont conçues pour Claude Code, mais elles fonctionnent aussi sur Claude.ai.

**Pour une utilisation ponctuelle :**
1. Ouvrez le fichier `SKILL.md` de la skill souhaitée dans ce dépôt
2. Copiez tout le texte
3. Collez-le au début de votre message dans Claude.ai

**Pour une utilisation permanente dans un Projet :**
1. Ouvrez un Projet Claude.ai (ou créez-en un)
2. Allez dans **Instructions du projet**
3. Collez le contenu du `SKILL.md`
4. Vous pouvez aussi uploader les fichiers du dossier `references/` comme Connaissances du projet — Claude les utilisera automatiquement

<!-- screenshot : Panneau des instructions d'un Projet Claude.ai avec un SKILL.md collé à l'intérieur. Fichier suggéré : docs/images/claudeai-project-instructions.png -->

---

## Les 8 skills en détail

### `/humanizer` — Supprime les tournures IA

Collez n'importe quel texte. Claude analyse 20 patterns IA (phrases creuses d'ouverture, mots pompeux, listes en règle de trois, abus de tirets cadratins, formules de clôture génériques…) et réécrit les passages problématiques. Montre exactement ce qui a changé et pourquoi.

> **À utiliser quand :** vous avez rédigé quelque chose avec de l'IA et ça sonne encore comme un communiqué de presse.

<!-- screenshot : Un output humanizer avant/après. Gauche : "La plateforme se veut un témoignage de l'innovation, offrant une expérience fluide et intuitive." Droite : "La plateforme charge vite et vous permet de faire X sans quitter l'écran." Section "Ce qui a changé" visible en dessous. Fichier suggéré : docs/images/skill-humanizer.png -->

---

### `/fact-checker` — Vérifie chaque affirmation

Extrait chaque déclaration vérifiable de votre texte et la contrôle contre des sources primaires. Rend un verdict pour chacune : ✅ Vrai · ⚠️ Plutôt vrai · 🔶 Mixte · ❓ Invérifiable · ❌ Faux · 🔄 Périmé.

> **À utiliser quand :** vous êtes sur le point de publier du contenu généré par IA, un post LinkedIn, une newsletter ou une présentation commerciale.

<!-- screenshot : Rapport Fact Checker montrant un tableau d'affirmations avec des badges de verdict colorés, une entrée ❌ Faux avec une correction suggérée et une URL source visible. Fichier suggéré : docs/images/skill-fact-checker.png -->

---

### `/prompt-master` — Corrigez vos prompts avant d'envoyer

Prend une entrée désorganisée et la restructure en prompt clair adapté à l'outil IA exact que vous utilisez (Claude, ChatGPT, o3, Cursor, Midjourney, etc.). Sait quelles techniques éviter selon l'outil.

> **À utiliser quand :** vous avez une demande complexe et Claude rate constamment la cible.

<!-- screenshot : Output Prompt Master montrant le bloc de prompt optimisé, suivi de "🎯 Cible : Claude Code · Une phrase expliquant ce qui a été optimisé." Fichier suggéré : docs/images/skill-prompt-master.png -->

---

### `/process-interviewer` — Planifiez avant de construire

Conduit un entretien structuré de 10 à 15 questions avant tout démarrage. Une question à la fois. Chaque question vient avec une réponse suggérée. Se termine par un cahier des charges complet que vous pouvez redonner à Claude pour construire.

> **À utiliser quand :** vous avez une idée floue et voulez la transformer en quelque chose de concret avant d'écrire une seule ligne de code ou un seul prompt.

<!-- screenshot : Un échange en cours d'entretien : Claude posant une question ciblée avec une réponse suggérée ("Je recommanderais X, parce que…"), et la réponse de l'utilisateur en dessous. Fichier suggéré : docs/images/skill-process-interviewer.png -->

---

### `/decision-toolkit` — Réfléchissez clairement aux grandes décisions

Vous guide à travers 9 angles d'analyse : test du départ à zéro, cartographie des parties prenantes, audit des biais cognitifs, test de timing, coût d'opportunité, pré-mortem, analyse de scénarios, minimisation des regrets, effets de second ordre. Génère un rapport Markdown ou un wizard HTML interactif à remplir comme un formulaire.

> **À utiliser quand :** vous faites face à une décision qui compte — prix, recrutement, pivot, partenariat — et que vous voulez penser clairement plutôt que suivre votre instinct.

<!-- screenshot : Le fichier decision-guide-template.html ouvert dans un navigateur, montrant l'écran Audit des biais avec des cases à cocher et la barre de progression en haut. Fichier suggéré : docs/images/skill-decision-wizard.png -->

---

### `/frontend-slides` — Créez une présentation dans votre navigateur

Génère une présentation HTML animée complète en un seul fichier autonome. Choisissez parmi 12 styles visuels (sombre et percutant, pastels doux, éditorial, cyber néon…) ou appliquez votre propre charte graphique. Navigation clavier, notes de présentateur et plein écran intégrés.

> **À utiliser quand :** vous avez besoin de slides et ne voulez pas ouvrir PowerPoint.

<!-- screenshot : Une slide terminée ouverte dans un navigateur — idéalement un preset visuellement distinctif (Bold Signal ou Dark Botanical), avec un compteur de slides et un indicateur de progression visibles. Fichier suggéré : docs/images/skill-frontend-slides.png -->

---

### `/find-skills` — Cherchez avant de construire

Recherche dans la bibliothèque communautaire skills.sh (90 000+ skills) par description de tâche. Retourne des résultats classés par nombre d'installations, affiche des métriques de qualité, et permet d'installer le meilleur choix en une commande. Si rien ne correspond, passe directement à `/process-interviewer`.

> **À utiliser quand :** vous voulez que Claude fasse quelque chose de nouveau et vous ne savez pas si quelqu'un l'a déjà construit.

<!-- screenshot : Output Find Skills montrant un tableau de résultats classés avec les noms des skills, les installations, et un choix "⭐ Recommandé" mis en évidence. Fichier suggéré : docs/images/skill-find-skills.png -->

---

### `/mcp-builder` — Connectez Claude à n'importe quel outil *(profil technique)*

Construit un serveur MCP fonctionnel à partir de la documentation d'une API. Output : un fichier serveur, un bloc de config JSON et un guide d'installation étape par étape. Fonctionne en TypeScript (par défaut) et Python. Gère tous les types d'authentification courants (clé API, Bearer, OAuth).

> **À utiliser quand :** vous voulez que Claude lise ou écrive des données dans un outil qui n'a pas d'intégration Claude native.

<!-- screenshot : Output MCP Builder montrant le fichier serveur TypeScript, le bloc de config JSON et les étapes d'installation numérotées. Fichier suggéré : docs/images/skill-mcp-builder.png -->

---

## Compatibilité

| Skill | Claude Code | Claude.ai |
|-------|:-----------:|:---------:|
| `/humanizer` | ✅ | ✅ |
| `/fact-checker` | ✅ | ✅ Recherche web requise |
| `/prompt-master` | ✅ | ✅ |
| `/decision-toolkit` | ✅ | ✅ HTML s'affiche comme artefact |
| `/frontend-slides` | ✅ | ✅ HTML s'affiche comme artefact |
| `/process-interviewer` | ✅ | ✅ |
| `/find-skills` | ✅ | ⚠️ Recherche web requise |
| `/mcp-builder` | ✅ | ⚠️ Génération de code OK ; installation nécessite Claude Code |

---

## Créé par

[Pablo Nastar](https://www.linkedin.com/in/pablo-nastar/) — Agence IA [ChappyGo](https://chappygo.com), Toulouse.

Nous aidons les PME à automatiser de vrais processus métier avec des agents IA — pas juste des chatbots.

---

Si ces skills vous font gagner du temps → ⭐ mettez une étoile au dépôt. Ça aide les autres à le trouver.
