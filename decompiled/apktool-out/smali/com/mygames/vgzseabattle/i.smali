.class Lcom/mygames/vgzseabattle/i;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/ActivityMenu;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/ActivityMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const/4 v4, 0x1

    const/4 v2, 0x3

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->a(Lcom/mygames/vgzseabattle/ActivityMenu;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(Lcom/mygames/vgzseabattle/ActivityMenu;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->a(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(Lcom/mygames/vgzseabattle/ActivityMenu;)I

    move-result v0

    if-le v0, v2, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v8}, Lcom/mygames/vgzseabattle/ActivityMenu;->a(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v8}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V

    :cond_0
    sget-boolean v0, Lcom/mygames/vgzseabattle/p;->d:Z

    if-eqz v0, :cond_1

    sput-boolean v8, Lcom/mygames/vgzseabattle/p;->d:Z

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v8}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V

    :cond_1
    sget-boolean v0, Lcom/mygames/vgzseabattle/p;->c:Z

    if-eqz v0, :cond_3

    :cond_2
    :goto_0
    return-void

    :cond_3
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->c(Lcom/mygames/vgzseabattle/ActivityMenu;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v8}, Lcom/mygames/vgzseabattle/ActivityMenu;->c(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v8}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V

    :cond_4
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->d(Lcom/mygames/vgzseabattle/ActivityMenu;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->e(Lcom/mygames/vgzseabattle/ActivityMenu;)[I

    move-result-object v0

    aget v0, v0, v8

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->f(Lcom/mygames/vgzseabattle/ActivityMenu;)[I

    move-result-object v0

    aget v0, v0, v8

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    int-to-float v0, v0

    div-float v2, v1, v0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->f(Lcom/mygames/vgzseabattle/ActivityMenu;)[I

    move-result-object v7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->g(Lcom/mygames/vgzseabattle/ActivityMenu;)Landroid/media/SoundPool;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->e(Lcom/mygames/vgzseabattle/ActivityMenu;)[I

    move-result-object v1

    aget v1, v1, v8

    const/16 v5, 0x2710

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    aput v0, v7, v8

    :cond_5
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0, v4}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(Lcom/mygames/vgzseabattle/ActivityMenu;Z)V

    :cond_6
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->h(Lcom/mygames/vgzseabattle/ActivityMenu;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->i(Lcom/mygames/vgzseabattle/ActivityMenu;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->b(Lcom/mygames/vgzseabattle/ActivityMenu;I)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->i(Lcom/mygames/vgzseabattle/ActivityMenu;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->j(Lcom/mygames/vgzseabattle/ActivityMenu;)V

    goto/16 :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->k(Lcom/mygames/vgzseabattle/ActivityMenu;)V

    goto/16 :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->l(Lcom/mygames/vgzseabattle/ActivityMenu;)V

    goto/16 :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/mygames/vgzseabattle/i;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityMenu;->m(Lcom/mygames/vgzseabattle/ActivityMenu;)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
