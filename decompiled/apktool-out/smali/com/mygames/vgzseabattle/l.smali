.class public Lcom/mygames/vgzseabattle/l;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field private a:Landroid/media/MediaPlayer;

.field private b:Ljava/util/Timer;

.field private c:Landroid/content/Context;

.field private d:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/l;->a()V

    const/16 v0, 0x14

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    return-void
.end method

.method static synthetic a(Lcom/mygames/vgzseabattle/l;)Landroid/media/MediaPlayer;
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method private a()V
    .locals 6

    const-wide/16 v2, 0x32

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->b:Ljava/util/Timer;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->b:Ljava/util/Timer;

    new-instance v1, Lcom/mygames/vgzseabattle/m;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/m;-><init>(Lcom/mygames/vgzseabattle/l;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    return-void
.end method

.method private a(I)V
    .locals 2

    sparse-switch p1, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040016

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040017

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040025

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_3
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040027

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_4
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040029

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04002b

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_6
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04002d

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04002f

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_8
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040031

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_9
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040033

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto :goto_0

    :sswitch_a
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040018

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_b
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04001c

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_c
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04001d

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_d
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04001e

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_e
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04001f

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_f
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040020

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_10
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040021

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_11
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040022

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_12
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040023

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_13
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040024

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_14
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040026

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_15
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040028

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_16
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04002a

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_17
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04002c

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_18
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04002e

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_19
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040030

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_1a
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040032

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_1b
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040034

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_1c
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040019

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_1d
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04001a

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_1e
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f04001b

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_1f
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040014

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    :sswitch_20
    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->c:Landroid/content/Context;

    const v1, 0x7f040015

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0xa -> :sswitch_a
        0xb -> :sswitch_b
        0xc -> :sswitch_c
        0xd -> :sswitch_d
        0xe -> :sswitch_e
        0xf -> :sswitch_f
        0x10 -> :sswitch_10
        0x11 -> :sswitch_11
        0x12 -> :sswitch_12
        0x13 -> :sswitch_13
        0x14 -> :sswitch_14
        0x1e -> :sswitch_15
        0x28 -> :sswitch_16
        0x32 -> :sswitch_17
        0x3c -> :sswitch_18
        0x46 -> :sswitch_19
        0x50 -> :sswitch_1a
        0x5a -> :sswitch_1b
        0x64 -> :sswitch_1c
        0x3e8 -> :sswitch_1d
        0xf4240 -> :sswitch_1e
        0xf4241 -> :sswitch_1f
        0xf4242 -> :sswitch_20
    .end sparse-switch
.end method

.method private b()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x14

    if-lt v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    const/4 v2, -0x1

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static synthetic b(Lcom/mygames/vgzseabattle/l;)V
    .locals 0

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/l;->c()V

    return-void
.end method

.method private b(Z)V
    .locals 9

    const/4 v0, 0x1

    const v7, 0xf4240

    const/16 v6, 0x64

    const/16 v5, 0x14

    const/4 v1, 0x0

    sget v2, Lcom/mygames/vgzseabattle/p;->b:I

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/l;->b()V

    if-nez v2, :cond_0

    if-eqz p1, :cond_d

    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    const v3, 0xf4241

    aput v3, v2, v1

    :goto_0
    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    const v2, 0xf4242

    aput v2, v1, v0

    :goto_1
    return-void

    :cond_0
    if-eqz p1, :cond_c

    iget-object v3, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    const v4, 0xf4241

    aput v4, v3, v1

    :goto_2
    div-int v1, v2, v7

    if-lez v1, :cond_b

    mul-int v3, v1, v7

    sub-int/2addr v2, v3

    div-int/lit8 v3, v1, 0x64

    if-lez v3, :cond_a

    mul-int/lit8 v4, v3, 0x64

    sub-int/2addr v1, v4

    iget-object v4, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v3, v4, v0

    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v6, v3, v0

    add-int/lit8 v0, v0, 0x1

    move v8, v1

    move v1, v0

    move v0, v8

    :goto_3
    div-int/lit8 v3, v0, 0xa

    if-lez v3, :cond_9

    mul-int/lit8 v4, v3, 0xa

    sub-int/2addr v0, v4

    iget-object v4, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    mul-int/lit8 v3, v3, 0xa

    aput v3, v4, v1

    add-int/lit8 v1, v1, 0x1

    move v8, v0

    move v0, v1

    move v1, v8

    :goto_4
    if-lez v1, :cond_1

    if-ge v1, v5, :cond_1

    iget-object v3, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v1, v3, v0

    add-int/lit8 v0, v0, 0x1

    :cond_1
    iget-object v1, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v7, v1, v0

    add-int/lit8 v0, v0, 0x1

    move v1, v2

    :goto_5
    div-int/lit16 v2, v1, 0x3e8

    if-lez v2, :cond_3

    mul-int/lit16 v3, v2, 0x3e8

    sub-int v3, v1, v3

    div-int/lit8 v4, v2, 0x64

    if-lez v4, :cond_8

    mul-int/lit8 v1, v4, 0x64

    sub-int v1, v2, v1

    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v4, v2, v0

    add-int/lit8 v0, v0, 0x1

    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v6, v2, v0

    add-int/lit8 v0, v0, 0x1

    move v8, v1

    move v1, v0

    move v0, v8

    :goto_6
    div-int/lit8 v2, v0, 0xa

    if-lez v2, :cond_7

    mul-int/lit8 v4, v2, 0xa

    sub-int/2addr v0, v4

    iget-object v4, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    mul-int/lit8 v2, v2, 0xa

    aput v2, v4, v1

    add-int/lit8 v1, v1, 0x1

    move v8, v0

    move v0, v1

    move v1, v8

    :goto_7
    if-lez v1, :cond_2

    if-ge v1, v5, :cond_2

    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    :cond_2
    iget-object v1, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    const/16 v2, 0x3e8

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    move v1, v3

    :cond_3
    div-int/lit8 v2, v1, 0x64

    if-lez v2, :cond_4

    mul-int/lit8 v3, v2, 0x64

    sub-int/2addr v1, v3

    iget-object v3, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v2, v3, v0

    add-int/lit8 v0, v0, 0x1

    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v6, v2, v0

    add-int/lit8 v0, v0, 0x1

    :cond_4
    if-lez v1, :cond_5

    if-ge v1, v5, :cond_5

    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    :goto_8
    iget-object v1, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    const v2, 0xf4242

    aput v2, v1, v0

    goto/16 :goto_1

    :cond_5
    div-int/lit8 v2, v1, 0xa

    if-lez v2, :cond_6

    mul-int/lit8 v3, v2, 0xa

    sub-int/2addr v1, v3

    iget-object v3, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    mul-int/lit8 v2, v2, 0xa

    aput v2, v3, v0

    add-int/lit8 v0, v0, 0x1

    :cond_6
    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_7
    move v8, v0

    move v0, v1

    move v1, v8

    goto :goto_7

    :cond_8
    move v1, v0

    move v0, v2

    goto :goto_6

    :cond_9
    move v8, v0

    move v0, v1

    move v1, v8

    goto/16 :goto_4

    :cond_a
    move v8, v1

    move v1, v0

    move v0, v8

    goto/16 :goto_3

    :cond_b
    move v1, v2

    goto/16 :goto_5

    :cond_c
    move v0, v1

    goto/16 :goto_2

    :cond_d
    move v0, v1

    goto/16 :goto_0
.end method

.method private c()V
    .locals 5

    const/4 v1, 0x0

    const/4 v4, -0x2

    move v0, v1

    :goto_0
    const/16 v2, 0x14

    if-lt v0, v2, :cond_0

    :goto_1
    return-void

    :cond_0
    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aget v2, v2, v0

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    sput-boolean v1, Lcom/mygames/vgzseabattle/p;->c:Z

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aget v2, v2, v0

    if-le v2, v4, :cond_2

    iget-object v1, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/mygames/vgzseabattle/l;->a(I)V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aput v4, v1, v0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/mygames/vgzseabattle/n;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/n;-><init>(Lcom/mygames/vgzseabattle/l;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public a(Z)V
    .locals 3

    const/4 v2, 0x0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/mygames/vgzseabattle/p;->c:Z

    invoke-direct {p0, p1}, Lcom/mygames/vgzseabattle/l;->b(Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    aget v0, v0, v2

    invoke-direct {p0, v0}, Lcom/mygames/vgzseabattle/l;->a(I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->d:[I

    const/4 v1, -0x2

    aput v1, v0, v2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/mygames/vgzseabattle/o;

    invoke-direct {v1, p0}, Lcom/mygames/vgzseabattle/o;-><init>(Lcom/mygames/vgzseabattle/l;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/l;->a:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    invoke-direct {p0}, Lcom/mygames/vgzseabattle/l;->c()V

    return-void
.end method
