.class Lcom/mygames/vgzseabattle/s;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/MainActivity;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/s;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const-wide/16 v2, 0x64

    new-instance v0, Lcom/mygames/vgzseabattle/ag;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/ag;-><init>()V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/s;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->o(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/ag;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mygames/vgzseabattle/s;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->p(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/s;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->k(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/mygames/vgzseabattle/s;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/MainActivity;->p(Lcom/mygames/vgzseabattle/MainActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/s;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/MainActivity;->m(Lcom/mygames/vgzseabattle/MainActivity;)I

    move-result v1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method
