.class public Lcom/mygames/vgzseabattle/ActivityLearnSounds;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private a:Landroid/widget/Button;

.field private b:Landroid/widget/Button;

.field private c:Landroid/widget/Button;

.field private d:Landroid/widget/Button;

.field private e:Landroid/widget/Button;

.field private f:Landroid/widget/Button;

.field private g:Landroid/widget/Button;

.field private h:Landroid/widget/Button;

.field private i:Landroid/widget/Button;

.field private j:Landroid/widget/Button;

.field private k:I

.field private l:[I

.field private m:[I

.field private n:Landroid/media/SoundPool;

.field private o:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/16 v0, 0x32

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    return-void
.end method

.method private a()V
    .locals 4

    const/16 v3, 0xc

    const/4 v1, 0x0

    new-array v0, v3, [I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    new-array v0, v3, [I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->m:[I

    move v0, v1

    :goto_0
    if-lt v0, v3, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    aput v1, v2, v0

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->m:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private a(I)V
    .locals 8

    const/4 v2, 0x3

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d()V

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->m:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

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

.method private b()V
    .locals 2

    const v0, 0x7f080001

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080002

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->b:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->b:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080003

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->c:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->c:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080004

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080005

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->e:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->e:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080006

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->f:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->f:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080007

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->g:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->g:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080008

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->h:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->h:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f080009

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->i:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->i:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const v0, 0x7f08000a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->j:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->j:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->b:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->b:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->c:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->c:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->e:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->e:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->f:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->f:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->g:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->g:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->h:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->h:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->i:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->i:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->j:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->j:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private c()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->setVolumeControlStream(I)V

    new-instance v0, Landroid/media/SoundPool;

    const/16 v1, 0xc

    invoke-direct {v0, v1, v3, v4}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v2, 0x7f040003

    invoke-virtual {v1, p0, v2, v5}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v2, 0x7f04000f

    invoke-virtual {v1, p0, v2, v6}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v2, 0x7f040007

    invoke-virtual {v1, p0, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v2, 0x7f040006

    invoke-virtual {v1, p0, v2, v7}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v2, 0x7f040001

    const/4 v3, 0x5

    invoke-virtual {v1, p0, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v3, 0x7f040008

    const/4 v4, 0x6

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v3, 0x7f04000e

    const/4 v4, 0x7

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v3, 0x7f040002

    const/16 v4, 0x8

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->l:[I

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    const v3, 0x7f040005

    const/16 v4, 0x9

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    return-void
.end method

.method private d()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->n:Landroid/media/SoundPool;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->m:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->stop(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private e()V
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d()V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->d:Z

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->finish()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->setContentView(I)V

    const-string v0, "window"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    div-int/lit8 v0, v0, 0xb

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->k:I

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/high16 v0, 0x7f080000

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->o:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->o:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->c()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->b()V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d()V

    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d()V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->d:Z

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->finish()V

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    const/4 v1, 0x0

    const/4 v0, 0x1

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a:Landroid/widget/Button;

    if-ne p1, v2, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    :goto_0
    return v0

    :cond_0
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->b:Landroid/widget/Button;

    if-ne p1, v2, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_1

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->c:Landroid/widget/Button;

    if-ne p1, v2, :cond_2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_2

    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->d:Landroid/widget/Button;

    if-ne p1, v2, :cond_3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_3

    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->e:Landroid/widget/Button;

    if-ne p1, v2, :cond_4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_4

    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->f:Landroid/widget/Button;

    if-ne p1, v2, :cond_5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_5

    const/4 v1, 0x5

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->g:Landroid/widget/Button;

    if-ne p1, v2, :cond_6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_6

    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_6
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->h:Landroid/widget/Button;

    if-ne p1, v2, :cond_7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_7

    const/4 v1, 0x7

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_7
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->i:Landroid/widget/Button;

    if-ne p1, v2, :cond_8

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_8

    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->a(I)V

    goto :goto_0

    :cond_8
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->j:Landroid/widget/Button;

    if-ne p1, v2, :cond_9

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_9

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityLearnSounds;->e()V

    goto/16 :goto_0

    :cond_9
    move v0, v1

    goto/16 :goto_0
.end method
