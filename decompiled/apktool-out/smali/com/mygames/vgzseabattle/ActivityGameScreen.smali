.class public Lcom/mygames/vgzseabattle/ActivityGameScreen;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private A:Z

.field private B:[[Ljava/lang/String;

.field private a:Landroid/media/SoundPool;

.field private b:[I

.field private c:[I

.field private d:Landroid/os/Handler;

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:[[Landroid/widget/Button;

.field private m:Landroid/widget/Button;

.field private n:[[I

.field private o:[[I

.field private p:Ljava/util/Random;

.field private q:I

.field private r:Z

.field private s:Z

.field private t:Z

.field private u:I

.field private v:I

.field private w:I

.field private x:Z

.field private y:Z

.field private z:Lcom/mygames/vgzseabattle/l;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/16 v0, 0x3e8

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e:I

    const/16 v0, 0x3e9

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f:I

    const/16 v0, 0x3ea

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->g:I

    const/16 v0, 0x7d0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h:I

    const/16 v0, 0x7d1

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->i:I

    const/16 v0, 0x7d2

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->j:I

    const/16 v0, 0xbb8

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->k:I

    iput v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    iput v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    iput v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->y:Z

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    return-void
.end method

.method private A()V
    .locals 4

    const/4 v1, 0x1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->z()V

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    if-gez v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    :cond_0
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    sput v0, Lcom/mygames/vgzseabattle/p;->b:I

    sget-object v0, Lcom/mygames/vgzseabattle/p;->e:Lcom/mygames/vgzseabattle/z;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/mygames/vgzseabattle/p;->e:Lcom/mygames/vgzseabattle/z;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/z;->c()V

    :cond_1
    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->z:Lcom/mygames/vgzseabattle/l;

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/l;->a(Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->k:I

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e:I

    return v0
.end method

.method private a()V
    .locals 4

    const/16 v3, 0xd

    const/4 v1, 0x0

    new-array v0, v3, [I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    new-array v0, v3, [I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    move v0, v1

    :goto_0
    if-lt v0, v3, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aput v1, v2, v0

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private a(I)V
    .locals 7

    const/16 v6, 0xa

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-lt v2, v6, :cond_0

    return-void

    :cond_0
    move v0, v1

    :goto_1
    if-lt v0, v6, :cond_1

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    packed-switch p1, :pswitch_data_0

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :pswitch_0
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v3, v3, v2

    aget v3, v3, v0

    packed-switch v3, :pswitch_data_1

    :pswitch_1
    goto :goto_2

    :pswitch_2
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v4, v4, v2

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_2

    :pswitch_3
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v5, v5, v2

    aget-object v5, v5, v0

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " ship"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_2

    :pswitch_4
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v5, v5, v2

    aget-object v5, v5, v0

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " destroyed"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_2

    :pswitch_5
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v5, v5, v2

    aget-object v5, v5, v0

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " empty"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    :pswitch_6
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v3, v3, v2

    aget v3, v3, v0

    packed-switch v3, :pswitch_data_2

    :pswitch_7
    goto/16 :goto_2

    :pswitch_8
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v4, v4, v2

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    :pswitch_9
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v4, v4, v2

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    :pswitch_a
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v5, v5, v2

    aget-object v5, v5, v0

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " destroyed"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    :pswitch_b
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v5, v5, v2

    aget-object v5, v5, v0

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " empty"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_6
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_4
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_8
        :pswitch_9
        :pswitch_7
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method

.method private a(II)V
    .locals 2

    const/4 v1, 0x4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v0, v0, p1

    aget v0, v0, p2

    packed-switch v0, :pswitch_data_0

    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    goto :goto_0

    :pswitch_3
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    goto :goto_0

    :pswitch_4
    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private a(IILandroid/view/MotionEvent;)V
    .locals 1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->q:I

    if-nez v0, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(II)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b(II)V

    goto :goto_0
.end method

.method private a(Landroid/view/MotionEvent;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->q:I

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->j()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l()V

    goto :goto_0
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityGameScreen;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b(I)V

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->r:Z

    return-void
.end method

.method private a(Z)V
    .locals 8

    const/16 v7, 0xa6

    const/16 v6, 0x54

    const/16 v5, 0xa

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-lt v2, v5, :cond_1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(I)V

    if-eqz p1, :cond_0

    invoke-direct {p0, v5}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    :goto_1
    if-lt v0, v5, :cond_2

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v3, v3, v2

    aget v3, v3, v0

    packed-switch v3, :pswitch_data_0

    :goto_2
    :pswitch_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :pswitch_1
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    invoke-static {v1, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    :pswitch_2
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    invoke-static {v1, v6, v7}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    :pswitch_3
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    const/high16 v4, -0x10000

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    :pswitch_4
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    const v4, -0x777778

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private a([[IIII)Z
    .locals 5

    const/16 v4, 0x9

    const/4 v0, 0x0

    add-int v1, p3, p4

    :goto_0
    const/16 v2, 0xa

    if-ge p3, v2, :cond_0

    if-lt p3, v1, :cond_2

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    aget-object v2, p1, p2

    aget v2, v2, p3

    if-nez v2, :cond_1

    if-lez p2, :cond_3

    if-lez p3, :cond_3

    add-int/lit8 v2, p2, -0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, -0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_3
    if-lez p3, :cond_4

    aget-object v2, p1, p2

    add-int/lit8 v3, p3, -0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_4
    if-ge p2, v4, :cond_5

    if-lez p3, :cond_5

    add-int/lit8 v2, p2, 0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, -0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_5
    if-lez p2, :cond_6

    add-int/lit8 v2, p2, -0x1

    aget-object v2, p1, v2

    aget v2, v2, p3

    if-nez v2, :cond_1

    :cond_6
    if-lez p2, :cond_7

    if-ge p3, v4, :cond_7

    add-int/lit8 v2, p2, -0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, 0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_7
    if-ge p3, v4, :cond_8

    aget-object v2, p1, p2

    add-int/lit8 v3, p3, 0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_8
    if-ge p2, v4, :cond_9

    add-int/lit8 v2, p2, 0x1

    aget-object v2, p1, v2

    aget v2, v2, p3

    if-nez v2, :cond_1

    :cond_9
    if-ge p2, v4, :cond_a

    if-ge p3, v4, :cond_a

    add-int/lit8 v2, p2, 0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, 0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_a
    add-int/lit8 p3, p3, 0x1

    goto :goto_0
.end method

.method private a([[II)[[I
    .locals 5

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x64

    if-lt v0, v1, :cond_0

    :goto_1
    return-object p1

    :cond_0
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p:Ljava/util/Random;

    rsub-int/lit8 v2, p2, 0xa

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p:Ljava/util/Random;

    rsub-int/lit8 v3, p2, 0xa

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p:Ljava/util/Random;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    if-nez v3, :cond_1

    invoke-direct {p0, p1, v1, v2, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[IIII)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-direct {p0, p1, v1, v2, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b([[IIII)[[I

    move-result-object p1

    goto :goto_1

    :cond_1
    invoke-direct {p0, p1, v1, v2, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c([[IIII)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-direct {p0, p1, v1, v2, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d([[IIII)[[I

    move-result-object p1

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private b()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->setVolumeControlStream(I)V

    new-instance v0, Landroid/media/SoundPool;

    const/16 v1, 0xd

    invoke-direct {v0, v1, v3, v4}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const/high16 v2, 0x7f040000

    invoke-virtual {v1, p0, v2, v5}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v2, 0x7f040008

    invoke-virtual {v1, p0, v2, v6}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v2, 0x7f04000e

    invoke-virtual {v1, p0, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v2, 0x7f040002

    invoke-virtual {v1, p0, v2, v7}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v2, 0x7f040003

    const/4 v3, 0x5

    invoke-virtual {v1, p0, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    aput v1, v0, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v3, 0x7f040006

    const/4 v4, 0x6

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/4 v1, 0x6

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v3, 0x7f040007

    const/4 v4, 0x7

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/4 v1, 0x7

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v3, 0x7f04000f

    const/16 v4, 0x8

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/16 v1, 0x8

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v3, 0x7f040001

    const/16 v4, 0x9

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/16 v1, 0x9

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v3, 0x7f040005

    const/16 v4, 0xa

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/16 v1, 0xa

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v3, 0x7f040010

    const/16 v4, 0xb

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/16 v1, 0xb

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    const v3, 0x7f040009

    const/16 v4, 0xc

    invoke-virtual {v2, p0, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    aput v2, v0, v1

    return-void
.end method

.method private b(I)V
    .locals 2

    const/4 v0, 0x0

    iput p1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->q:I

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    packed-switch p1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    const-string v0, "My screen"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    const-string v1, "My screen menu"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    const-string v1, "My screen menu"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h()V

    goto :goto_0

    :pswitch_1
    const-string v0, "Opponent screen"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    const-string v1, "Opponent screen menu"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    const-string v1, "Opponent screen menu"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private b(II)V
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v0, v0, p1

    aget v0, v0, p2

    packed-switch v0, :pswitch_data_0

    iput p1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    iput p2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(I)V

    :goto_0
    return-void

    :pswitch_0
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->q()V

    return-void
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/ActivityGameScreen;I)V
    .locals 0

    iput p1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    return-void
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->s:Z

    return-void
.end method

.method private b([[IIII)[[I
    .locals 3

    add-int v0, p3, p4

    :goto_0
    const/16 v1, 0xa

    if-ge p3, v1, :cond_0

    if-lt p3, v0, :cond_1

    :cond_0
    return-object p1

    :cond_1
    aget-object v1, p1, p2

    const/4 v2, 0x1

    aput v2, v1, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_0
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f:I

    return v0
.end method

.method private c()V
    .locals 1

    new-instance v0, Lcom/mygames/vgzseabattle/a;

    invoke-direct {v0, p0}, Lcom/mygames/vgzseabattle/a;-><init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    return-void
.end method

.method private c(I)V
    .locals 11

    const-wide/16 v9, 0x3e8

    const/4 v8, 0x4

    const/4 v2, 0x3

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    if-nez p1, :cond_1

    float-to-double v0, v2

    const-wide v2, 0x3fe6666666666666L    # 0.7

    mul-double/2addr v0, v2

    double-to-float v2, v0

    :cond_1
    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aget v1, v1, v8

    const/4 v4, 0x5

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->r:Z

    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h:I

    invoke-virtual {v0, v1, v9, v10}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e:I

    invoke-virtual {v0, v1, v9, v10}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method private c(II)V
    .locals 4

    const/16 v3, 0x9

    const/4 v2, 0x4

    if-lez p2, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, -0x1

    aput v2, v0, v1

    :cond_0
    if-lez p1, :cond_1

    if-lez p2, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aput v2, v0, v1

    :cond_1
    if-lez p1, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    aget v0, v0, p2

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    aput v2, v0, p2

    :cond_2
    if-lez p1, :cond_3

    if-ge p2, v3, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aget v0, v0, v1

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aput v2, v0, v1

    :cond_3
    if-ge p2, v3, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, 0x1

    aget v0, v0, v1

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, 0x1

    aput v2, v0, v1

    :cond_4
    if-ge p1, v3, :cond_5

    if-ge p2, v3, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aget v0, v0, v1

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aput v2, v0, v1

    :cond_5
    if-ge p1, v3, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    aget v0, v0, p2

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    aput v2, v0, p2

    :cond_6
    if-ge p1, v3, :cond_7

    if-lez p2, :cond_7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aput v2, v0, v1

    :cond_7
    return-void
.end method

.method static synthetic c(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->t:Z

    return-void
.end method

.method private c([[IIII)Z
    .locals 5

    const/16 v4, 0x9

    const/4 v0, 0x0

    add-int v1, p2, p4

    :goto_0
    const/16 v2, 0xa

    if-ge p2, v2, :cond_0

    if-lt p2, v1, :cond_2

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    aget-object v2, p1, p2

    aget v2, v2, p3

    if-nez v2, :cond_1

    if-lez p2, :cond_3

    if-lez p3, :cond_3

    add-int/lit8 v2, p2, -0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, -0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_3
    if-lez p3, :cond_4

    aget-object v2, p1, p2

    add-int/lit8 v3, p3, -0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_4
    if-ge p2, v4, :cond_5

    if-lez p3, :cond_5

    add-int/lit8 v2, p2, 0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, -0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_5
    if-lez p2, :cond_6

    add-int/lit8 v2, p2, -0x1

    aget-object v2, p1, v2

    aget v2, v2, p3

    if-nez v2, :cond_1

    :cond_6
    if-lez p2, :cond_7

    if-ge p3, v4, :cond_7

    add-int/lit8 v2, p2, -0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, 0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_7
    if-ge p3, v4, :cond_8

    aget-object v2, p1, p2

    add-int/lit8 v3, p3, 0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_8
    if-ge p2, v4, :cond_9

    add-int/lit8 v2, p2, 0x1

    aget-object v2, p1, v2

    aget v2, v2, p3

    if-nez v2, :cond_1

    :cond_9
    if-ge p2, v4, :cond_a

    if-ge p3, v4, :cond_a

    add-int/lit8 v2, p2, 0x1

    aget-object v2, p1, v2

    add-int/lit8 v3, p3, 0x1

    aget v2, v2, v3

    if-nez v2, :cond_1

    :cond_a
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method static synthetic d(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->g:I

    return v0
.end method

.method private d()V
    .locals 8

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

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v0, 0xa

    const/16 v2, 0xa

    filled-new-array {v0, v2}, [I

    move-result-object v0

    const-class v2, Ljava/lang/String;

    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080024

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080025

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080026

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080027

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const v0, 0x7f080028

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/4 v4, 0x5

    const v0, 0x7f080029

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/4 v4, 0x6

    const v0, 0x7f08002a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/4 v4, 0x7

    const v0, 0x7f08002b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/16 v4, 0x8

    const v0, 0x7f08002c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v1

    const/16 v4, 0x9

    const v0, 0x7f08002d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f08002e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f08002f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f080030

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f080031

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const v0, 0x7f080032

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/4 v4, 0x5

    const v0, 0x7f080033

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/4 v4, 0x6

    const v0, 0x7f080034

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/4 v4, 0x7

    const v0, 0x7f080035

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/16 v4, 0x8

    const v0, 0x7f080036

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v3

    const/16 v4, 0x9

    const v0, 0x7f080037

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f080038

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f080039

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f08003a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f08003b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const v0, 0x7f08003c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/4 v4, 0x5

    const v0, 0x7f08003d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/4 v4, 0x6

    const v0, 0x7f08003e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/4 v4, 0x7

    const v0, 0x7f08003f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/16 v4, 0x8

    const v0, 0x7f080040

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v5

    const/16 v4, 0x9

    const v0, 0x7f080041

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080042

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080043

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080044

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080045

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const v0, 0x7f080046

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/4 v4, 0x5

    const v0, 0x7f080047

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/4 v4, 0x6

    const v0, 0x7f080048

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/4 v4, 0x7

    const v0, 0x7f080049

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/16 v4, 0x8

    const v0, 0x7f08004a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v6

    const/16 v4, 0x9

    const v0, 0x7f08004b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f08004f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const v0, 0x7f080050

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/4 v4, 0x5

    const v0, 0x7f080051

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/4 v4, 0x6

    const v0, 0x7f080052

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/4 v4, 0x7

    const v0, 0x7f080053

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/16 v4, 0x8

    const v0, 0x7f080054

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v2, v0, v7

    const/16 v4, 0x9

    const v0, 0x7f080055

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080056

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080057

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080058

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f080059

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const v0, 0x7f08005a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f08005b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f08005c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f08005d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f08005e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x5

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f08005f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080060

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080061

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080062

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080063

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const v0, 0x7f080064

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f080065

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f080066

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f080067

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f080068

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x6

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f080069

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const v0, 0x7f08006e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f08006f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f080070

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f080071

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f080072

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/4 v2, 0x7

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f080073

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080074

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080075

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080076

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080077

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const v0, 0x7f080078

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f080079

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f08007a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f08007b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f08007c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x8

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f08007d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f08007e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f08007f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f080080

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f080081

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const v0, 0x7f080082

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/4 v4, 0x5

    const v0, 0x7f080083

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/4 v4, 0x6

    const v0, 0x7f080084

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/4 v4, 0x7

    const v0, 0x7f080085

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/16 v4, 0x8

    const v0, 0x7f080086

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    const/16 v2, 0x9

    aget-object v2, v0, v2

    const/16 v4, 0x9

    const v0, 0x7f080087

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

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

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v7, v7, v4

    aget-object v7, v7, v0

    invoke-virtual {v7, v6}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->B:[[Ljava/lang/String;

    aget-object v7, v7, v4

    aput-object v6, v7, v0

    iget-object v6, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v6, v6, v4

    aget-object v6, v6, v0

    invoke-virtual {v6, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private d(I)V
    .locals 12

    const-wide/16 v10, 0x64

    const/4 v9, 0x5

    const/4 v2, 0x3

    const/4 v8, 0x1

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    if-ne p1, v8, :cond_1

    float-to-double v0, v2

    const-wide v2, 0x3fe6666666666666L    # 0.7

    mul-double/2addr v0, v2

    double-to-float v2, v0

    :cond_1
    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aget v1, v1, v9

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v9

    iput-boolean v8, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->s:Z

    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->i:I

    invoke-virtual {v0, v1, v10, v11}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f:I

    invoke-virtual {v0, v1, v10, v11}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method private d(II)V
    .locals 4

    const/16 v3, 0x9

    const/4 v2, 0x4

    if-lez p2, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, -0x1

    aput v2, v0, v1

    :cond_0
    if-lez p1, :cond_1

    if-lez p2, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aput v2, v0, v1

    :cond_1
    if-lez p1, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    aget v0, v0, p2

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    aput v2, v0, p2

    :cond_2
    if-lez p1, :cond_3

    if-ge p2, v3, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aget v0, v0, v1

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, -0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aput v2, v0, v1

    :cond_3
    if-ge p2, v3, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, 0x1

    aget v0, v0, v1

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v0, v0, p1

    add-int/lit8 v1, p2, 0x1

    aput v2, v0, v1

    :cond_4
    if-ge p1, v3, :cond_5

    if-ge p2, v3, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aget v0, v0, v1

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aput v2, v0, v1

    :cond_5
    if-ge p1, v3, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    aget v0, v0, p2

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    aput v2, v0, p2

    :cond_6
    if-ge p1, v3, :cond_7

    if-lez p2, :cond_7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    add-int/lit8 v1, p2, -0x1

    aput v2, v0, v1

    :cond_7
    return-void
.end method

.method static synthetic d(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->x:Z

    return-void
.end method

.method private d([[IIII)[[I
    .locals 3

    add-int v0, p2, p4

    :goto_0
    const/16 v1, 0xa

    if-ge p2, v1, :cond_0

    if-lt p2, v0, :cond_1

    :cond_0
    return-object p1

    :cond_1
    aget-object v1, p1, p2

    const/4 v2, 0x1

    aput v2, v1, p3

    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method static synthetic e(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h:I

    return v0
.end method

.method private e()V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->g()V

    const-string v0, "My screen"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    const-string v1, "My screen menu"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n()V

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->r:Z

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->s:Z

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->t:Z

    iput v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    return-void
.end method

.method private e(I)V
    .locals 14

    const/4 v9, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v4, 0x6

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v0, v1, v0

    if-ne p1, v9, :cond_1

    float-to-double v0, v0

    const-wide v7, 0x3fe6666666666666L    # 0.7

    mul-double/2addr v0, v7

    double-to-float v0, v0

    :cond_1
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p:Ljava/util/Random;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    if-nez v1, :cond_3

    move v2, v0

    :goto_1
    iput-boolean v9, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->t:Z

    if-nez p1, :cond_2

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    const/4 v8, 0x5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/4 v9, 0x5

    aget v1, v1, v9

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->j:I

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aget v8, v1, v4

    const/4 v11, 0x7

    move v9, v2

    move v10, v3

    move v12, v5

    move v13, v6

    invoke-virtual/range {v7 .. v13}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v1

    aput v1, v0, v4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->g:I

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_3
    move v2, v3

    move v3, v0

    goto :goto_1
.end method

.method private f()V
    .locals 8

    const/16 v7, 0xa

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v1, 0x0

    const/4 v4, 0x1

    move v2, v1

    :goto_0
    if-lt v2, v7, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v6}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v6}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v5}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v5}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v5}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    return-void

    :cond_0
    move v0, v1

    :goto_1
    if-lt v0, v7, :cond_1

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v3, v3, v2

    aput v1, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private f(I)V
    .locals 14

    const/16 v8, 0xa

    const/16 v9, 0x9

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    const/4 v8, 0x2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/4 v3, 0x2

    aget v1, v1, v3

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    goto :goto_0

    :pswitch_2
    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aget v1, v1, v9

    move v3, v2

    move v4, v8

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v9

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aget v8, v1, v4

    const/4 v11, 0x4

    move v9, v2

    move v10, v2

    move v12, v5

    move v13, v6

    invoke-virtual/range {v7 .. v13}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v1

    aput v1, v0, v4

    goto :goto_0

    :pswitch_4
    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    const/16 v8, 0x8

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/16 v3, 0x8

    aget v1, v1, v3

    move v3, v2

    move v4, v9

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    goto :goto_0

    :pswitch_5
    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aget v1, v1, v8

    const/16 v4, 0xb

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    goto :goto_0

    :pswitch_6
    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    const/16 v8, 0xb

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    const/16 v3, 0xb

    aget v1, v1, v3

    const/16 v4, 0xc

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method static synthetic f(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v()V

    return-void
.end method

.method static synthetic g(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->i:I

    return v0
.end method

.method private g()V
    .locals 8

    const/16 v7, 0xa

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v1, 0x0

    const/4 v4, 0x1

    move v2, v1

    :goto_0
    if-lt v2, v7, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v6}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v6}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v5}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v5}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v5}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0, v0, v4}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a([[II)[[I

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    return-void

    :cond_0
    move v0, v1

    :goto_1
    if-lt v0, v7, :cond_1

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v3, v3, v2

    aput v1, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private h()V
    .locals 8

    const/16 v7, 0xa

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-lt v2, v7, :cond_1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(I)V

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->x:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u()V

    :cond_0
    return-void

    :cond_1
    move v0, v1

    :goto_1
    if-lt v0, v7, :cond_2

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v3, v3, v2

    aget v3, v3, v0

    packed-switch v3, :pswitch_data_0

    :goto_2
    :pswitch_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :pswitch_1
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    const/16 v4, 0x54

    const/16 v5, 0xa6

    invoke-static {v1, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    :pswitch_2
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    const/16 v4, 0xff

    const/16 v5, 0xf5

    const/16 v6, 0x68

    invoke-static {v4, v5, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    :pswitch_3
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    const/high16 v4, -0x10000

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    :pswitch_4
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    const v4, -0x777778

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method static synthetic h(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u()V

    return-void
.end method

.method static synthetic i(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->j:I

    return v0
.end method

.method private i()V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/CharSequence;

    const/4 v1, 0x0

    const-string v2, "Show my screen"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Show opponent screen"

    aput-object v2, v0, v1

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Choose the screen"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lcom/mygames/vgzseabattle/b;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/b;-><init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o()V

    return-void
.end method

.method static synthetic j(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I
    .locals 1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->k:I

    return v0
.end method

.method private j()V
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

    const-string v2, "Stop game"

    aput-object v2, v0, v1

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "My screen menu"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lcom/mygames/vgzseabattle/c;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/c;-><init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static synthetic k(Lcom/mygames/vgzseabattle/ActivityGameScreen;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d:Landroid/os/Handler;

    return-object v0
.end method

.method private k()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Game help"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "There is a menu button at the top of the screen. Below the menu button is your ship\'s field which consists of 10 rows. There are 10 buttons in each row. \nPut your finger on the screen and move it either up and down, to the left and to the right to know where the buttons are placed.Tap the button to know is this button empty or one of your ships is placed there.\nTap the menu button to get the game menu. Use the item Show opponent screen to get the opponet\'s ships screen. Yo can shoot the opponet\'s ships on opponent screen only.Your ships screen will show automatically when your opponent will shoot your ships."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Ok"

    new-instance v2, Lcom/mygames/vgzseabattle/d;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/d;-><init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private l()V
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/CharSequence;

    const/4 v1, 0x0

    const-string v2, "Close menu"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Show my screen"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Help"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Stop game"

    aput-object v2, v0, v1

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Opponent screen menu"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lcom/mygames/vgzseabattle/e;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/e;-><init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static synthetic l(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e()V

    return-void
.end method

.method private m()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Game help"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "There is a menu button at the top of the screen. Below the menu button is opponent\'s ship\'s field which consists of 10 rows. There are 10 buttons in each row. \nPut your finger on the screen and move it either up and down, to the left and to the right to know where the buttons are placed.\nOpponent\'s ships are placed secretly. Tap the button to shoot the opponent\'s ships. You will hear the target hit sound if you will succeed, otherwise you will hear lose sound. \nTap the menu button to get the game menu. Use the item Show my screen to get the your ships screen. Your ships screen will show automatically when your opponent will shoot your ships."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Ok"

    new-instance v2, Lcom/mygames/vgzseabattle/f;

    invoke-direct {v2, p0}, Lcom/mygames/vgzseabattle/f;-><init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static synthetic m(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o()V

    return-void
.end method

.method private n()V
    .locals 9

    const/4 v2, 0x3

    const/4 v8, 0x0

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

    aget v0, v0, v8

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    aget v0, v0, v8

    if-nez v0, :cond_0

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

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

.method static synthetic n(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->k()V

    return-void
.end method

.method private o()V
    .locals 9

    const/4 v2, 0x3

    const/4 v8, 0x1

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b:[I

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

.method static synthetic o(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A()V

    return-void
.end method

.method private p()V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v0, v0, v1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    invoke-direct {p0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(I)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e(I)V

    goto :goto_0
.end method

.method static synthetic p(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m()V

    return-void
.end method

.method private q()V
    .locals 4

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v0, v0, v1

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    const/4 v2, 0x3

    aput v2, v0, v1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    add-int/lit8 v0, v0, 0x14

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->r()V

    invoke-direct {p0, v3}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Z)V

    :goto_0
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    const/4 v2, 0x4

    aput v2, v0, v1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Z)V

    goto :goto_0
.end method

.method private r()V
    .locals 6

    const/16 v5, 0xa

    const/4 v4, 0x4

    const/4 v3, 0x1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_0
    if-lt v0, v5, :cond_5

    :cond_0
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_1
    if-gtz v0, :cond_6

    :cond_1
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_2
    if-lt v0, v5, :cond_7

    :cond_2
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_3
    if-gtz v0, :cond_8

    :cond_3
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->s()V

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    add-int/lit8 v0, v0, 0x64

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->t()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A()V

    :cond_4
    return-void

    :cond_5
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v4, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v4, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_7
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v4, :cond_2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_8
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v4, :cond_3

    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_3
.end method

.method private s()V
    .locals 5

    const/16 v4, 0xa

    const/4 v3, 0x4

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(II)V

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_0
    if-lt v0, v4, :cond_4

    :cond_0
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_1
    if-gtz v0, :cond_5

    :cond_1
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_2
    if-lt v0, v4, :cond_6

    :cond_2
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_3
    if-gtz v0, :cond_7

    :cond_3
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    return-void

    :cond_4
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_0

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(II)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_6
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_2

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    invoke-direct {p0, v1, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_7
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_3

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    invoke-direct {p0, v1, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(II)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_3
.end method

.method private t()Z
    .locals 6

    const/16 v5, 0xa

    const/4 v0, 0x1

    const/4 v1, 0x0

    move v3, v1

    :goto_0
    if-lt v3, v5, :cond_1

    move v0, v1

    :cond_0
    return v0

    :cond_1
    move v2, v1

    :goto_1
    if-lt v2, v5, :cond_2

    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    aget-object v4, v4, v3

    aget v4, v4, v2

    if-eq v4, v0, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private u()V
    .locals 7

    const/16 v3, 0x9

    const/16 v6, 0xa

    const/4 v5, 0x1

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->x:Z

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->y:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v2

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v0, v0, v2

    const/4 v2, 0x3

    if-ne v0, v2, :cond_5

    iput-boolean v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->y:Z

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v0, v2

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v0, v0, v2

    if-ne v0, v5, :cond_2

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(I)V

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    if-ge v0, v3, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    add-int/lit8 v2, v2, 0x1

    aget-object v0, v0, v2

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v0, v0, v2

    if-ne v0, v5, :cond_3

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(I)V

    goto :goto_0

    :cond_3
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v2

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    add-int/lit8 v2, v2, -0x1

    aget v0, v0, v2

    if-ne v0, v5, :cond_4

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(I)V

    goto :goto_0

    :cond_4
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    if-ge v0, v3, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v2

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    add-int/lit8 v2, v2, 0x1

    aget v0, v0, v2

    if-ne v0, v5, :cond_6

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(I)V

    goto/16 :goto_0

    :cond_5
    iput-boolean v5, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->y:Z

    :cond_6
    move v0, v1

    :goto_1
    const/16 v2, 0x64

    if-lt v0, v2, :cond_7

    move v2, v1

    :goto_2
    if-ge v2, v6, :cond_0

    move v0, v1

    :goto_3
    if-lt v0, v6, :cond_a

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_2

    :cond_7
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p:Ljava/util/Random;

    invoke-virtual {v2, v6}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    iput v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p:Ljava/util/Random;

    invoke-virtual {v2, v6}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    iput v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v2, v2, v3

    iget v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v2, v2, v3

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v2, v2, v3

    iget v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v2, v2, v3

    if-ne v2, v5, :cond_9

    :cond_8
    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(I)V

    goto/16 :goto_0

    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_a
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v3, v3, v2

    aget v3, v3, v0

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v4, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v3, v3, v4

    iget v4, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v3, v3, v4

    if-ne v3, v5, :cond_c

    :cond_b
    iput v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(I)V

    goto/16 :goto_0

    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method

.method private v()V
    .locals 4

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->x:Z

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v0, v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    const/4 v2, 0x3

    aput v2, v0, v1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    add-int/lit8 v0, v0, -0xa

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h()V

    invoke-direct {p0, v3}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    const/4 v2, 0x4

    aput v2, v0, v1

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h()V

    invoke-direct {p0, v3}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e(I)V

    goto :goto_0
.end method

.method private w()V
    .locals 6

    const/16 v5, 0xa

    const/4 v4, 0x4

    const/4 v3, 0x1

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_0
    if-lt v0, v5, :cond_5

    :cond_0
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_1
    if-gtz v0, :cond_6

    :cond_1
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_2
    if-lt v0, v5, :cond_7

    :cond_2
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_3
    if-gtz v0, :cond_8

    :cond_3
    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->x()V

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    add-int/lit8 v0, v0, -0x32

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->y()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A()V

    :cond_4
    return-void

    :cond_5
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v4, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v4, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_7
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v4, :cond_2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_8
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v4, :cond_3

    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_3
.end method

.method private x()V
    .locals 5

    const/16 v4, 0xa

    const/4 v3, 0x4

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(II)V

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_0
    if-lt v0, v4, :cond_4

    :cond_0
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    :goto_1
    if-gtz v0, :cond_5

    :cond_1
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_2
    if-lt v0, v4, :cond_6

    :cond_2
    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    :goto_3
    if-gtz v0, :cond_7

    :cond_3
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(I)V

    return-void

    :cond_4
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_0

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v1, v1, v0

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    aget v1, v1, v2

    if-eq v1, v3, :cond_1

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->v:I

    invoke-direct {p0, v0, v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(II)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_6
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_2

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    invoke-direct {p0, v1, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_7
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    iget v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-eq v1, v3, :cond_3

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->u:I

    invoke-direct {p0, v1, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(II)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_3
.end method

.method private y()Z
    .locals 6

    const/16 v5, 0xa

    const/4 v0, 0x1

    const/4 v1, 0x0

    move v3, v1

    :goto_0
    if-lt v3, v5, :cond_1

    iput v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->w:I

    move v0, v1

    :cond_0
    return v0

    :cond_1
    move v2, v1

    :goto_1
    if-lt v2, v5, :cond_2

    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    aget-object v4, v4, v3

    aget v4, v4, v2

    if-eq v4, v0, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private z()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xc

    if-lt v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a:Landroid/media/SoundPool;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->stop(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    const/16 v3, 0xa

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->setContentView(I)V

    new-instance v0, Lcom/mygames/vgzseabattle/l;

    invoke-direct {v0, p0}, Lcom/mygames/vgzseabattle/l;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->z:Lcom/mygames/vgzseabattle/l;

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    filled-new-array {v3, v3}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->n:[[I

    filled-new-array {v3, v3}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->o:[[I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d()V

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->p:Ljava/util/Random;

    const v0, 0x7f080023

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b()V

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->r:Z

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->s:Z

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->t:Z

    iput-boolean v2, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->x:Z

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->i()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e()V

    invoke-direct {p0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b(I)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    const/16 v4, 0xa

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->r:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->s:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->t:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->A:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->m:Landroid/widget/Button;

    if-ne p1, v0, :cond_2

    invoke-direct {p0, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Landroid/view/MotionEvent;)V

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_1
    if-ge v2, v4, :cond_0

    move v0, v1

    :goto_2
    if-lt v0, v4, :cond_3

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    :cond_3
    iget-object v3, p0, Lcom/mygames/vgzseabattle/ActivityGameScreen;->l:[[Landroid/widget/Button;

    aget-object v3, v3, v2

    aget-object v3, v3, v0

    if-ne p1, v3, :cond_4

    invoke-direct {p0, v2, v0, p2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(IILandroid/view/MotionEvent;)V

    goto :goto_0

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method
