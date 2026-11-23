.class public Lcom/mygames/vgzseabattle/ActivityMenu;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private a:Landroid/media/SoundPool;

.field private b:[I

.field private c:[I

.field private d:Ljava/util/Timer;

.field private e:Landroid/widget/RelativeLayout;

.field private f:Z

.field private g:I

.field private h:Z

.field private i:Landroid/widget/Button;

.field private j:Landroid/widget/Button;

.field private k:Landroid/widget/Button;

.field private l:Landroid/widget/Button;

.field private m:Landroid/widget/Button;

.field private n:Landroid/widget/Button;

.field private o:Landroid/widget/Button;

.field private p:Landroid/widget/Button;

.field private q:I

.field private r:Lcom/mygames/vgzseabattle/l;

.field private s:Z

.field private t:Z

.field private u:I

.field private v:Ljava/lang/String;

.field private w:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->f:Z

    iput v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->g:I

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->h:Z

    const/16 v0, 0x32

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->s:Z

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->t:Z

    iput v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->u:I

    const-string v0, ""

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->v:Ljava/lang/String;

    const/4 v0, 0x1

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->w:I

    return-void
.end method

.method private a()V
    .locals 2

    const v0, 0x7f08000e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->i:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->i:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f08000f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->j:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->j:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080010

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->k:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->k:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080011

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->l:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->l:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080012

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->m:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->m:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080013

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->n:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->n:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080014

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->o:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->o:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080015

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->p:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->p:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->i:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->i:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->j:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->j:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->k:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->k:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->l:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->l:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->m:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->m:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->n:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->n:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->o:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->o:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->p:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->p:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private a(I)V
    .locals 8

    const/4 v2, 0x3

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->q()V

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    aget v1, v1, p1

    add-int/lit8 v4, p1, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, p1

    return-void
.end method

.method private a(Landroid/view/MotionEvent;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b()V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b()V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityMenu;I)V
    .locals 0

    iput p1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->u:I

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->t:Z

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityMenu;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->t:Z

    return v0
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/ActivityMenu;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->u:I

    return v0
.end method

.method private b()V
    .locals 9

    const/4 v2, 0x3

    const/4 v8, 0x1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aget v1, v1, v8

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    aget v1, v1, v8

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    return-void
.end method

.method private b(I)V
    .locals 2

    iput p1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->w:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->u()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mygames/vgzseabattle/k;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/k;-><init>(Lcom/mygames/vgzseabattle/ActivityMenu;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/ActivityMenu;I)V
    .locals 0

    iput p1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->g:I

    return-void
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->h:Z

    return-void
.end method

.method private c()V
    .locals 9

    const/4 v2, 0x3

    const/4 v8, 0x4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aget v1, v1, v8

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    aget v1, v1, v8

    const/4 v4, 0x5

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    return-void
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/ActivityMenu;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mygames/vgzseabattle/ActivityMenu;->a(I)V

    return-void
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->s:Z

    return-void
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/ActivityMenu;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->s:Z

    return v0
.end method

.method private d()V
    .locals 4

    const/16 v3, 0xd

    const/4 v1, 0x0

    new-array v0, v3, [I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    new-array v0, v3, [I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    move v0, v1

    :goto_0
    if-lt v0, v3, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    aput v1, v2, v0

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static synthetic d(Lcom/mygames/vgzseabattle/ActivityMenu;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->h:Z

    return v0
.end method

.method private e()V
    .locals 6

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->d:Ljava/util/Timer;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->d:Ljava/util/Timer;

    new-instance v1, Lcom/mygames/vgzseabattle/i;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/i;-><init>(Lcom/mygames/vgzseabattle/ActivityMenu;)V

    const-wide/16 v2, 0x7d0

    const-wide/16 v4, 0x3e8

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    return-void
.end method

.method static synthetic e(Lcom/mygames/vgzseabattle/ActivityMenu;)[I
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    return-object v0
.end method

.method private f()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/mygames/vgzseabattle/ActivityMenu;->setVolumeControlStream(I)V

    new-instance v0, Landroid/media/SoundPool;

    const/16 v1, 0xa

    invoke-direct {v0, v1, v3, v4}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v2, 0x7f040012

    invoke-virtual {v1, p0, v2, v5}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v2, 0x7f040011

    invoke-virtual {v1, p0, v2, v6}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v2, 0x7f040036

    invoke-virtual {v1, p0, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v2, 0x7f040037

    invoke-virtual {v1, p0, v2, v7}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v2, 0x7f040013

    const/4 v3, 0x5

    invoke-virtual {v1, p0, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v3, 0x7f04000d

    const/4 v4, 0x6

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v3, 0x7f04000a

    const/4 v4, 0x7

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v3, 0x7f04000b

    const/16 v4, 0x8

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    const v3, 0x7f04000c

    const/16 v4, 0x9

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    return-void
.end method

.method static synthetic f(Lcom/mygames/vgzseabattle/ActivityMenu;)[I
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    return-object v0
.end method

.method static synthetic g(Lcom/mygames/vgzseabattle/ActivityMenu;)Landroid/media/SoundPool;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    return-object v0
.end method

.method private g()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->stop(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private h()V
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    const/4 v0, 0x2

    sput v0, Lcom/mygames/vgzseabattle/p;->g:I

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(I)V

    return-void
.end method

.method static synthetic h(Lcom/mygames/vgzseabattle/ActivityMenu;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->f:Z

    return v0
.end method

.method static synthetic i(Lcom/mygames/vgzseabattle/ActivityMenu;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->g:I

    return v0
.end method

.method private i()V
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->f:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->g:I

    return-void
.end method

.method private j()V
    .locals 9

    const/4 v8, 0x2

    const/4 v4, 0x3

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    aget v1, v1, v8

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    return-void
.end method

.method static synthetic j(Lcom/mygames/vgzseabattle/ActivityMenu;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    return-void
.end method

.method private k()V
    .locals 9

    const/4 v8, 0x3

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v3, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    aget v1, v1, v8

    const/4 v2, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    return-void
.end method

.method static synthetic k(Lcom/mygames/vgzseabattle/ActivityMenu;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->j()V

    return-void
.end method

.method private l()V
    .locals 9

    const/4 v2, 0x3

    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->f:Z

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aget v0, v0, v8

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->b:[I

    aget v1, v1, v8

    const/4 v4, 0x1

    const/16 v5, 0x2710

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    goto :goto_0
.end method

.method static synthetic l(Lcom/mygames/vgzseabattle/ActivityMenu;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->k()V

    return-void
.end method

.method private m()V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    sput v0, Lcom/mygames/vgzseabattle/p;->g:I

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(I)V

    return-void
.end method

.method static synthetic m(Lcom/mygames/vgzseabattle/ActivityMenu;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->l()V

    return-void
.end method

.method static synthetic n(Lcom/mygames/vgzseabattle/ActivityMenu;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->v:Ljava/lang/String;

    return-object v0
.end method

.method private n()V
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    const/4 v0, 0x2

    sput v0, Lcom/mygames/vgzseabattle/p;->g:I

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(I)V

    return-void
.end method

.method static synthetic o(Lcom/mygames/vgzseabattle/ActivityMenu;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->w:I

    return v0
.end method

.method private o()V
    .locals 2

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->r:Lcom/mygames/vgzseabattle/l;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/l;->a(Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->s:Z

    return-void
.end method

.method private p()V
    .locals 2

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    sget v0, Lcom/mygames/vgzseabattle/p;->b:I

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->o()V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mygames/vgzseabattle/j;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/j;-><init>(Lcom/mygames/vgzseabattle/ActivityMenu;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private q()V
    .locals 3

    const/4 v0, 0x5

    :goto_0
    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->stop(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private r()V
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    const/4 v0, 0x2

    sput v0, Lcom/mygames/vgzseabattle/p;->g:I

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(I)V

    return-void
.end method

.method private s()V
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c()V

    const/4 v0, 0x1

    sput v0, Lcom/mygames/vgzseabattle/p;->a:I

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->finish()V

    return-void
.end method

.method private t()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aput v2, v0, v2

    return-void
.end method

.method private u()V
    .locals 5

    new-instance v0, Lcom/mygames/vgzseabattle/x;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/x;-><init>()V

    const-string v1, "data0.txt"

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/x;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/mygames/vgzseabattle/w;

    invoke-direct {v1}, Lcom/mygames/vgzseabattle/w;-><init>()V

    invoke-virtual {v1, p0}, Lcom/mygames/vgzseabattle/w;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0}, Lcom/mygames/vgzseabattle/w;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/mygames/vgzseabattle/w;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Lcom/mygames/vgzseabattle/aa;

    invoke-direct {v4}, Lcom/mygames/vgzseabattle/aa;-><init>()V

    invoke-virtual {v4, v2, v0}, Lcom/mygames/vgzseabattle/aa;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/mygames/vgzseabattle/aa;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v3, v0}, Lcom/mygames/vgzseabattle/aa;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/mygames/vgzseabattle/aa;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->v:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    const/4 v2, 0x0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string v0, "window"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    div-int/lit8 v0, v0, 0x9

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->q:I

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->setContentView(I)V

    const v0, 0x7f08000d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->e:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->e:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->d()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->f()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->a()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->e()V

    new-instance v0, Lcom/mygames/vgzseabattle/l;

    invoke-direct {v0, p0}, Lcom/mygames/vgzseabattle/l;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->r:Lcom/mygames/vgzseabattle/l;

    sget-object v0, Lcom/mygames/vgzseabattle/p;->e:Lcom/mygames/vgzseabattle/z;

    if-nez v0, :cond_0

    new-instance v0, Lcom/mygames/vgzseabattle/z;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/z;-><init>()V

    sput-object v0, Lcom/mygames/vgzseabattle/p;->e:Lcom/mygames/vgzseabattle/z;

    sget-object v0, Lcom/mygames/vgzseabattle/p;->e:Lcom/mygames/vgzseabattle/z;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/z;->a()V

    :cond_0
    new-instance v0, Lcom/mygames/vgzseabattle/v;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/v;-><init>()V

    :try_start_0
    invoke-virtual {v0, p0}, Lcom/mygames/vgzseabattle/v;->a(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->t:Z

    iput v2, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->u:I

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->g()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->d:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    return-void
.end method

.method public onPause()V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    const/4 v1, 0x0

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->c:[I

    aget v0, v0, v1

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->h:Z

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    const/4 v0, 0x1

    sput v0, Lcom/mygames/vgzseabattle/p;->g:I

    return-void
.end method

.method public onStop()V
    .locals 2

    const/4 v1, 0x1

    sget v0, Lcom/mygames/vgzseabattle/p;->a:I

    if-nez v0, :cond_0

    sget v0, Lcom/mygames/vgzseabattle/p;->g:I

    if-ne v0, v1, :cond_0

    sput v1, Lcom/mygames/vgzseabattle/p;->a:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->g()V

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->finish()V

    :cond_0
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->t()V

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    const/4 v1, 0x1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->f:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->e:Landroid/widget/RelativeLayout;

    if-ne p1, v0, :cond_2

    invoke-direct {p0, p2}, Lcom/mygames/vgzseabattle/ActivityMenu;->a(Landroid/view/MotionEvent;)V

    :cond_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->i:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->h()V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->j:Landroid/widget/Button;

    if-ne p1, v0, :cond_4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->i()V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->k:Landroid/widget/Button;

    if-ne p1, v0, :cond_5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_5

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->m()V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->l:Landroid/widget/Button;

    if-ne p1, v0, :cond_6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_6

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->n()V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->m:Landroid/widget/Button;

    if-ne p1, v0, :cond_7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_7

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->o()V

    goto :goto_0

    :cond_7
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->n:Landroid/widget/Button;

    if-ne p1, v0, :cond_8

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->p()V

    goto :goto_0

    :cond_8
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->o:Landroid/widget/Button;

    if-ne p1, v0, :cond_9

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_9

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->r()V

    goto :goto_0

    :cond_9
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityMenu;->p:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityMenu;->s()V

    goto :goto_0
.end method
