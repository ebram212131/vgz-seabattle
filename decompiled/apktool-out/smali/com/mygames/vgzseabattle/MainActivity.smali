.class public Lcom/mygames/vgzseabattle/MainActivity;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private a:Landroid/os/Handler;

.field private b:Landroid/media/SoundPool;

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:Z

.field private h:Ljava/util/Timer;

.field private i:I

.field private j:Ljava/lang/String;

.field private k:Z

.field private l:Landroid/widget/ImageView;

.field private m:Landroid/widget/RelativeLayout;

.field private n:Landroid/app/Activity;

.field private o:I

.field private p:I

.field private q:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    iput v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->c:I

    iput v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->d:I

    iput v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->e:I

    iput v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->f:I

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->g:Z

    iput v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->i:I

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->j:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->k:Z

    iput-object p0, p0, Lcom/mygames/vgzseabattle/MainActivity;->n:Landroid/app/Activity;

    const/16 v0, 0x3e8

    iput v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->o:I

    const/16 v0, 0x3e9

    iput v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->p:I

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->q:Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/MainActivity;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->c:I

    return v0
.end method

.method private a()V
    .locals 1

    new-instance v0, Lcom/mygames/vgzseabattle/r;

    invoke-direct {v0, p0}, Lcom/mygames/vgzseabattle/r;-><init>(Lcom/mygames/vgzseabattle/MainActivity;)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->a:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/MainActivity;I)V
    .locals 0

    iput p1, p0, Lcom/mygames/vgzseabattle/MainActivity;->d:I

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/MainActivity;->j:Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/mygames/vgzseabattle/MainActivity;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/MainActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/MainActivity;->g:Z

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const-string v0, "\\*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/MainActivity;->q:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mygames/vgzseabattle/MainActivity;->j:Ljava/lang/String;

    new-instance v1, Lcom/mygames/vgzseabattle/aa;

    invoke-direct {v1}, Lcom/mygames/vgzseabattle/aa;-><init>()V

    const/4 v2, 0x0

    aget-object v0, v0, v2

    invoke-virtual {v1, v0}, Lcom/mygames/vgzseabattle/aa;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->j:Ljava/lang/String;

    :goto_0
    return-void

    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mygames/vgzseabattle/t;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/t;-><init>(Lcom/mygames/vgzseabattle/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private b()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mygames/vgzseabattle/s;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/s;-><init>(Lcom/mygames/vgzseabattle/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/MainActivity;I)V
    .locals 0

    iput p1, p0, Lcom/mygames/vgzseabattle/MainActivity;->i:I

    return-void
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/MainActivity;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/MainActivity;->k:Z

    return-void
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/MainActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->g:Z

    return v0
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/media/SoundPool;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->b:Landroid/media/SoundPool;

    return-object v0
.end method

.method private c()Ljava/lang/String;
    .locals 5

    new-instance v0, Lcom/mygames/vgzseabattle/x;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/x;-><init>()V

    const-string v1, "data0.txt"

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/x;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->q:Ljava/lang/String;

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

    iget-object v4, p0, Lcom/mygames/vgzseabattle/MainActivity;->q:Ljava/lang/String;

    invoke-virtual {v3, v1, v4}, Lcom/mygames/vgzseabattle/aa;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/mygames/vgzseabattle/aa;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/mygames/vgzseabattle/MainActivity;->q:Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Lcom/mygames/vgzseabattle/aa;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/mygames/vgzseabattle/aa;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/MainActivity;I)V
    .locals 0

    iput p1, p0, Lcom/mygames/vgzseabattle/MainActivity;->f:I

    return-void
.end method

.method static synthetic d(Lcom/mygames/vgzseabattle/MainActivity;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->i:I

    return v0
.end method

.method private d()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Error Internet connection"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Please check your Internet connection and then try to run the game again."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Ok"

    new-instance v2, Lcom/mygames/vgzseabattle/u;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/u;-><init>(Lcom/mygames/vgzseabattle/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static synthetic e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->j:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic f(Lcom/mygames/vgzseabattle/MainActivity;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->d:I

    return v0
.end method

.method static synthetic g(Lcom/mygames/vgzseabattle/MainActivity;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->e:I

    return v0
.end method

.method static synthetic h(Lcom/mygames/vgzseabattle/MainActivity;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->k:Z

    return v0
.end method

.method static synthetic i(Lcom/mygames/vgzseabattle/MainActivity;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->f:I

    return v0
.end method

.method static synthetic j(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/util/Timer;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->h:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic k(Lcom/mygames/vgzseabattle/MainActivity;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->o:I

    return v0
.end method

.method static synthetic l(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/MainActivity;->c()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic m(Lcom/mygames/vgzseabattle/MainActivity;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->p:I

    return v0
.end method

.method static synthetic n(Lcom/mygames/vgzseabattle/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/MainActivity;->d()V

    return-void
.end method

.method static synthetic o(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->n:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic p(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->a:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 9

    const-wide/16 v2, 0x3e8

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/MainActivity;->setContentView(I)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/MainActivity;->a()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/MainActivity;->b()V

    new-instance v0, Lcom/mygames/vgzseabattle/v;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/v;-><init>()V

    :try_start_0
    invoke-virtual {v0, p0}, Lcom/mygames/vgzseabattle/v;->a(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    sput v6, Lcom/mygames/vgzseabattle/p;->a:I

    const v0, 0x7f08000c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->l:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->l:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f08000b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->m:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->h:Ljava/util/Timer;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->h:Ljava/util/Timer;

    new-instance v1, Lcom/mygames/vgzseabattle/q;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/q;-><init>(Lcom/mygames/vgzseabattle/MainActivity;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    invoke-virtual {p0, v8}, Lcom/mygames/vgzseabattle/MainActivity;->setVolumeControlStream(I)V

    new-instance v0, Landroid/media/SoundPool;

    invoke-direct {v0, v7, v8, v6}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->b:Landroid/media/SoundPool;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->b:Landroid/media/SoundPool;

    const v1, 0x7f040004

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->c:I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->b:Landroid/media/SoundPool;

    const v1, 0x7f040035

    invoke-virtual {v0, p0, v1, v7}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v0

    iput v0, p0, Lcom/mygames/vgzseabattle/MainActivity;->e:I

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
