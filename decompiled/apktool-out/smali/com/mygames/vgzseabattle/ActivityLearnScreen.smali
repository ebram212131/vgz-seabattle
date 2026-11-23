.class public Lcom/mygames/vgzseabattle/ActivityLearnScreen;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private a:Landroid/widget/Button;

.field private b:[[Landroid/widget/Button;

.field private c:I

.field private d:I

.field private e:Landroid/media/SoundPool;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private a()V
    .locals 4

    const/4 v3, 0x3

    const/4 v2, 0x1

    invoke-virtual {p0, v3}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->setVolumeControlStream(I)V

    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x0

    invoke-direct {v0, v2, v3, v1}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->e:Landroid/media/SoundPool;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->e:Landroid/media/SoundPool;

    const v1, 0x7f040008

    invoke-virtual {v0, p0, v1, v2}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->c:I

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->c()V

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityLearnScreen;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a(Ljava/lang/String;)V

    return-void
.end method

.method private a(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Learn screen dialog"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Ok"

    new-instance v2, Lcom/mygames/vgzseabattle/h;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/h;-><init>(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private b()V
    .locals 9

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/16 v0, 0xa

    const/16 v2, 0xa

    filled-new-array {v0, v2}, [I

    move-result-object v0

    const-class v2, Landroid/widget/Button;

    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080024

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080025

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080026

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080027

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080028

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/4 v4, 0x5

    const v0, 0x7f080029

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/4 v4, 0x6

    const v0, 0x7f08002a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/4 v4, 0x7

    const v0, 0x7f08002b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/16 v4, 0x8

    const v0, 0x7f08002c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/16 v4, 0x9

    const v0, 0x7f08002d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f08002e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f08002f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f080030

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f080031

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f080032

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/4 v4, 0x5

    const v0, 0x7f080033

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/4 v4, 0x6

    const v0, 0x7f080034

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/4 v4, 0x7

    const v0, 0x7f080035

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/16 v4, 0x8

    const v0, 0x7f080036

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/16 v4, 0x9

    const v0, 0x7f080037

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f080038

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f080039

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f08003a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f08003b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f08003c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/4 v4, 0x5

    const v0, 0x7f08003d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/4 v4, 0x6

    const v0, 0x7f08003e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/4 v4, 0x7

    const v0, 0x7f08003f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/16 v4, 0x8

    const v0, 0x7f080040

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/16 v4, 0x9

    const v0, 0x7f080041

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080042

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080043

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080044

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080045

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080046

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/4 v4, 0x5

    const v0, 0x7f080047

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/4 v4, 0x6

    const v0, 0x7f080048

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/4 v4, 0x7

    const v0, 0x7f080049

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/16 v4, 0x8

    const v0, 0x7f08004a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/16 v4, 0x9

    const v0, 0x7f08004b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f080050

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/4 v4, 0x5

    const v0, 0x7f080051

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/4 v4, 0x6

    const v0, 0x7f080052

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/4 v4, 0x7

    const v0, 0x7f080053

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/16 v4, 0x8

    const v0, 0x7f080054

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/16 v4, 0x9

    const v0, 0x7f080055

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080056

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080057

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080058

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080059

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f08005a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f08005b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f08005c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f08005d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f08005e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f08005f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080060

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080061

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080062

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080063

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080064

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f080065

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f080066

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f080067

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f080068

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f080069

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f08006f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f080070

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f080071

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f080072

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f080073

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080074

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080075

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080076

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080077

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080078

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f080079

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f08007a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f08007b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f08007c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f08007d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f08007e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f08007f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f080080

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f080081

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f080082

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f080083

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f080084

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f080085

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f080086

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f080087

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    const/16 v0, 0x61

    move v4, v1

    move v5, v0

    :goto_0
    const/16 v0, 0xa

    if-lt v4, v0, :cond_0

    return-void

    :cond_0
    move v0, v1

    move v2, v3

    :goto_1
    const/16 v6, 0xa

    if-lt v0, v6, :cond_1

    add-int/lit8 v0, v5, 0x1

    int-to-char v2, v0

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    move v5, v2

    goto :goto_0

    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v7, v7, v4

    aget-object v7, v7, v0

    invoke-virtual {v7, v6}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v6, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v6, v6, v4

    aget-object v6, v6, v0

    invoke-virtual {v6, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v6, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b:[[Landroid/widget/Button;

    aget-object v6, v6, v4

    aget-object v6, v6, v0

    const/16 v7, 0x54

    const/16 v8, 0xa6

    invoke-static {v1, v7, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setBackgroundColor(I)V

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private c()V
    .locals 7

    const/4 v2, 0x3

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->e:Landroid/media/SoundPool;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->c:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->d:I

    return-void
.end method

.method private d()V
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/CharSequence;

    const/4 v1, 0x0

    const-string v2, "Close menu"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Show opponent screen"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Help"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Return to main menu"

    aput-object v2, v0, v1

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Learn game screen menu"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lcom/mygames/vgzseabattle/g;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/g;-><init>(Lcom/mygames/vgzseabattle/ActivityLearnScreen;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const v0, 0x7f080023

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string v0, "Learn game screen"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a:Landroid/widget/Button;

    const-string v1, "Menu"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->b()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a()V

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->d:Z

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->finish()V

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->a:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->d()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnScreen;->c()V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method
