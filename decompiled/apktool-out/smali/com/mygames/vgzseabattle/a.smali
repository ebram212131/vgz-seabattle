.class Lcom/mygames/vgzseabattle/a;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/ActivityGameScreen;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v3}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Lcom/mygames/vgzseabattle/ActivityGameScreen;I)V

    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->e(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->f(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->g(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->b(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v3}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->h(Lcom/mygames/vgzseabattle/ActivityGameScreen;)V

    :cond_4
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->i(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    if-ne v0, v1, :cond_5

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v3}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->a(Lcom/mygames/vgzseabattle/ActivityGameScreen;I)V

    :cond_5
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->j(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    if-ne v0, v1, :cond_6

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->c(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0, v2}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->d(Lcom/mygames/vgzseabattle/ActivityGameScreen;Z)V

    sget-boolean v0, Lcom/mygames/vgzseabattle/p;->c:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->k(Lcom/mygames/vgzseabattle/ActivityGameScreen;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->j(Lcom/mygames/vgzseabattle/ActivityGameScreen;)I

    move-result v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_6
    :goto_0
    return-void

    :cond_7
    sput-boolean v3, Lcom/mygames/vgzseabattle/p;->d:Z

    iget-object v0, p0, Lcom/mygames/vgzseabattle/a;->a:Lcom/mygames/vgzseabattle/ActivityGameScreen;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/ActivityGameScreen;->finish()V

    goto :goto_0
.end method
