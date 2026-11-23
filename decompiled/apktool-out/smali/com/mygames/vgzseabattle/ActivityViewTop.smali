.class public Lcom/mygames/vgzseabattle/ActivityViewTop;
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

.field private k:Landroid/widget/Button;

.field private l:I

.field private m:Lcom/mygames/vgzseabattle/l;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private a()V
    .locals 2

    const v0, 0x7f080017

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->a:Landroid/widget/Button;

    const v0, 0x7f080018

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->b:Landroid/widget/Button;

    const v0, 0x7f080019

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->c:Landroid/widget/Button;

    const v0, 0x7f08001a

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->d:Landroid/widget/Button;

    const v0, 0x7f08001b

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->e:Landroid/widget/Button;

    const v0, 0x7f08001c

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->f:Landroid/widget/Button;

    const v0, 0x7f08001d

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->g:Landroid/widget/Button;

    const v0, 0x7f08001e

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->h:Landroid/widget/Button;

    const v0, 0x7f08001f

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->i:Landroid/widget/Button;

    const v0, 0x7f080020

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->j:Landroid/widget/Button;

    const v0, 0x7f080021

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->k:Landroid/widget/Button;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->a:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->a:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->a:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->b:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->b:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->b:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->c:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->c:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->c:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->d:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->d:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->d:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->e:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->e:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->e:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->f:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->f:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->f:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->g:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->g:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->g:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->h:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->h:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->h:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->i:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->i:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->i:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->j:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->j:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->j:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->k:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->k:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->k:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private a(I)V
    .locals 2

    sget-object v0, Lcom/mygames/vgzseabattle/p;->e:Lcom/mygames/vgzseabattle/z;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mygames/vgzseabattle/p;->e:Lcom/mygames/vgzseabattle/z;

    invoke-virtual {v0, p1}, Lcom/mygames/vgzseabattle/z;->a(I)I

    move-result v0

    sput v0, Lcom/mygames/vgzseabattle/p;->b:I

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->m:Lcom/mygames/vgzseabattle/l;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/l;->a(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->setContentView(I)V

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const-string v0, "window"

    invoke-virtual {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    iget v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    div-int/lit8 v0, v0, 0xc

    iput v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->l:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a()V

    new-instance v0, Lcom/mygames/vgzseabattle/l;

    invoke-direct {v0, p0}, Lcom/mygames/vgzseabattle/l;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->m:Lcom/mygames/vgzseabattle/l;

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->d:Z

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->finish()V

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    sget-boolean v2, Lcom/mygames/vgzseabattle/p;->c:Z

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->a:Landroid/widget/Button;

    if-ne p1, v2, :cond_2

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->b:Landroid/widget/Button;

    if-ne p1, v2, :cond_3

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->c:Landroid/widget/Button;

    if-ne p1, v2, :cond_4

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->d:Landroid/widget/Button;

    if-ne p1, v2, :cond_5

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->e:Landroid/widget/Button;

    if-ne p1, v2, :cond_6

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_6
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->f:Landroid/widget/Button;

    if-ne p1, v2, :cond_7

    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_7
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->g:Landroid/widget/Button;

    if-ne p1, v2, :cond_8

    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_8
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->h:Landroid/widget/Button;

    if-ne p1, v2, :cond_9

    const/4 v0, 0x7

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_9
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->i:Landroid/widget/Button;

    if-ne p1, v2, :cond_a

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_a
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->j:Landroid/widget/Button;

    if-ne p1, v2, :cond_b

    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->a(I)V

    move v0, v1

    goto :goto_0

    :cond_b
    iget-object v2, p0, Lcom/mygames/vgzseabattle/ActivityViewTop;->k:Landroid/widget/Button;

    if-ne p1, v2, :cond_0

    sput-boolean v1, Lcom/mygames/vgzseabattle/p;->d:Z

    invoke-virtual {p0}, Lcom/mygames/vgzseabattle/ActivityViewTop;->finish()V

    move v0, v1

    goto :goto_0
.end method
