.class Lcom/mygames/vgzseabattle/q;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/MainActivity;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    const/4 v5, 0x2

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v8, 0x3

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->b(Lcom/mygames/vgzseabattle/MainActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v7, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->c(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/media/SoundPool;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    invoke-static {v7, v0}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0, v4}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Z)V

    :cond_0
    sget-boolean v0, Lcom/mygames/vgzseabattle/p;->h:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->d(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->b(Lcom/mygames/vgzseabattle/MainActivity;I)V

    :cond_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->d(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_3

    sget-boolean v0, Lcom/mygames/vgzseabattle/p;->h:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Lcom/mygames/vgzseabattle/y;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/y;-><init>()V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/y;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "***"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->c(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/media/SoundPool;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->f(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_7

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-virtual {v1, v0}, Lcom/mygames/vgzseabattle/MainActivity;->startActivity(Landroid/content/Intent;)V

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->d(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->h(Lcom/mygames/vgzseabattle/MainActivity;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->c(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/media/SoundPool;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->f(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->c(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/media/SoundPool;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->i(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->j(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/MainActivity;->finish()V

    :cond_4
    sget v0, Lcom/mygames/vgzseabattle/p;->a:I

    if-ne v0, v4, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->j(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/MainActivity;->finish()V

    :cond_5
    return-void

    :cond_6
    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->e(Lcom/mygames/vgzseabattle/MainActivity;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "***"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->a(Lcom/mygames/vgzseabattle/MainActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_7
    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->c(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/media/SoundPool;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->f(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v9, v1, v0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->c(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/media/SoundPool;

    move-result-object v7

    iget-object v1, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->g(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v8

    const/4 v12, 0x0

    move v10, v9

    move v11, v5

    move v13, v6

    invoke-virtual/range {v7 .. v13}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v1

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/MainActivity;->c(Lcom/mygames/vgzseabattle/MainActivity;I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/q;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0, v4}, Lcom/mygames/vgzseabattle/MainActivity;->b(Lcom/mygames/vgzseabattle/MainActivity;Z)V

    goto/16 :goto_1
.end method
