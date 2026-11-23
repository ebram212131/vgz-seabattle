.class public Lcom/mygames/vgzseabattle/RegisterApp;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private a:Landroid/os/Handler;

.field private b:Landroid/widget/EditText;

.field private c:Landroid/widget/Button;

.field private d:Ljava/lang/String;

.field private e:Z

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:I

.field private i:I

.field private j:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->e:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->f:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->g:Ljava/lang/String;

    const/16 v0, 0x3e8

    iput v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->h:I

    const/16 v0, 0x3e9

    iput v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->i:I

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/RegisterApp;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->h:I

    return v0
.end method

.method private a()V
    .locals 1

    new-instance v0, Lcom/mygames/vgzseabattle/ab;

    invoke-direct {v0, p0}, Lcom/mygames/vgzseabattle/ab;-><init>(Lcom/mygames/vgzseabattle/RegisterApp;)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->a:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/RegisterApp;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/RegisterApp;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/RegisterApp;->e:Z

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Ok"

    new-instance v2, Lcom/mygames/vgzseabattle/ad;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/ad;-><init>(Lcom/mygames/vgzseabattle/RegisterApp;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private a(Ljava/lang/String;)Z
    .locals 4

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Login error!"

    const-string v2, "Please fill in Login text field"

    invoke-direct {p0, v0, v2}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return v1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xa

    if-le v0, v2, :cond_1

    const-string v0, "Wrong Login length!"

    const-string v2, "Your Login must have at least 10 characters"

    invoke-direct {p0, v0, v2}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_4

    const/16 v3, 0x39

    if-gt v2, v3, :cond_4

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    const/16 v3, 0x41

    if-lt v2, v3, :cond_5

    const/16 v3, 0x5a

    if-le v2, v3, :cond_3

    :cond_5
    const/16 v3, 0x61

    if-lt v2, v3, :cond_6

    const/16 v3, 0x7a

    if-le v2, v3, :cond_3

    :cond_6
    const-string v0, "Wrong character!"

    const-string v2, "Your Login must have at least 10 characters and limited to A - Z, 0 - 9"

    invoke-direct {p0, v0, v2}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private b()V
    .locals 7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->b:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->f:Ljava/lang/String;

    new-instance v0, Lcom/mygames/vgzseabattle/v;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/v;-><init>()V

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/v;->a()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    new-instance v0, Lcom/mygames/vgzseabattle/w;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/w;-><init>()V

    invoke-virtual {v0, p0}, Lcom/mygames/vgzseabattle/w;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0}, Lcom/mygames/vgzseabattle/w;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/w;->a()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Lcom/mygames/vgzseabattle/aa;

    invoke-direct {v3}, Lcom/mygames/vgzseabattle/aa;-><init>()V

    iget-object v4, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/mygames/vgzseabattle/aa;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    iget-object v4, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    const/4 v5, 0x0

    const/16 v6, 0xa

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    new-instance v4, Lcom/mygames/vgzseabattle/x;

    invoke-direct {v4}, Lcom/mygames/vgzseabattle/x;-><init>()V

    const-string v5, "data0.txt"

    iget-object v6, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/mygames/vgzseabattle/x;->a(Ljava/lang/String;Ljava/lang/String;)Z

    iget-object v4, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    invoke-virtual {v3, v1, v4}, Lcom/mygames/vgzseabattle/aa;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/mygames/vgzseabattle/aa;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Lcom/mygames/vgzseabattle/aa;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/mygames/vgzseabattle/aa;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/mygames/vgzseabattle/RegisterApp;->d:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->g:Ljava/lang/String;

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mygames/vgzseabattle/ac;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/ac;-><init>(Lcom/mygames/vgzseabattle/RegisterApp;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/RegisterApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->d()V

    return-void
.end method

.method private b(Ljava/lang/String;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string v0, "\\*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/mygames/vgzseabattle/aa;

    invoke-direct {v1}, Lcom/mygames/vgzseabattle/aa;-><init>()V

    aget-object v2, v0, v4

    aget-object v3, v0, v5

    invoke-virtual {v1, v4, v2, v3}, Lcom/mygames/vgzseabattle/aa;->a(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    sput v4, Lcom/mygames/vgzseabattle/p;->g:I

    new-instance v1, Landroid/content/Intent;

    aget-object v0, v0, v5

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/RegisterApp;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->i:I

    return v0
.end method

.method private c()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Register help"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "There is 1 text field and 1 button on the register screen. Please type in the text field your login or nickname and click the Register button.\nPut your finger on the screen and move it either up and down to know where text field and button are placed.\nTap twice the text field to open a virtual keyboard, if it wasn\'t opened automatically.\nWhen you have successfully completed the registration process you will be moved to a game menu."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Ok"

    new-instance v2, Lcom/mygames/vgzseabattle/ae;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/ae;-><init>(Lcom/mygames/vgzseabattle/RegisterApp;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private d()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    const-string v1, "\\*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v1, v0, v3

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const-string v0, "Registration error!"

    const-string v1, "Login expected"

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    aget-object v1, v0, v3

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    const-string v0, "Registration error!"

    const-string v1, "User ID expected"

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    aget-object v1, v0, v3

    const-string v2, "3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_2

    const-string v0, "Registration error!"

    const-string v1, "This login is already taken"

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    aget-object v0, v0, v3

    const-string v1, "1000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    const-string v1, "1000*"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    new-instance v0, Lcom/mygames/vgzseabattle/x;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/x;-><init>()V

    const-string v1, "data1.txt"

    iget-object v2, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/mygames/vgzseabattle/x;->a(Ljava/lang/String;Ljava/lang/String;)Z

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->e()V

    goto :goto_0

    :cond_3
    const-string v0, "Registration error!"

    const-string v1, "Unknown exception. Please try again"

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic d(Lcom/mygames/vgzseabattle/RegisterApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->f()V

    return-void
.end method

.method static synthetic e(Lcom/mygames/vgzseabattle/RegisterApp;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->g:Ljava/lang/String;

    return-object v0
.end method

.method private e()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mygames/vgzseabattle/af;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/af;-><init>(Lcom/mygames/vgzseabattle/RegisterApp;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic f(Lcom/mygames/vgzseabattle/RegisterApp;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->f:Ljava/lang/String;

    return-object v0
.end method

.method private f()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    const-string v1, "\\*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v1, v0, v3

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const-string v0, "Registration error!"

    const-string v1, "Wrong User ID"

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    aget-object v0, v0, v3

    const-string v1, "1000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    const-string v1, "1000*"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->j:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/RegisterApp;->b(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v0, "Registration error!"

    const-string v1, "Unknown exception. Please try again"

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic g(Lcom/mygames/vgzseabattle/RegisterApp;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->a:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030005

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/RegisterApp;->setContentView(I)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->a()V

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const v0, 0x7f08008a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/RegisterApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->b:Landroid/widget/EditText;

    const v0, 0x7f08008b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/RegisterApp;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->c:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->c:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->e:Z

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->c()V

    return-void
.end method

.method public onStart()V
    .locals 3

    const/16 v2, 0x64

    const/4 v1, 0x1

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    sget v0, Lcom/mygames/vgzseabattle/p;->a:I

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->finish()V

    :goto_0
    return-void

    :cond_0
    sget v0, Lcom/mygames/vgzseabattle/p;->g:I

    if-eqz v0, :cond_1

    sget v0, Lcom/mygames/vgzseabattle/p;->g:I

    if-eq v0, v2, :cond_1

    sput v1, Lcom/mygames/vgzseabattle/p;->a:I

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->finish()V

    goto :goto_0

    :cond_1
    sput v2, Lcom/mygames/vgzseabattle/p;->g:I

    goto :goto_0
.end method

.method public onStop()V
    .locals 3

    const/4 v2, 0x1

    sget v0, Lcom/mygames/vgzseabattle/p;->a:I

    if-eq v0, v2, :cond_0

    sget v0, Lcom/mygames/vgzseabattle/p;->g:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_1

    :cond_0
    sput v2, Lcom/mygames/vgzseabattle/p;->a:I

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->finish()V

    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->c:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/RegisterApp;->e:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/RegisterApp;->b()V

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
