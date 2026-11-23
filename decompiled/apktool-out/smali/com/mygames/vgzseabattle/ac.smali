.class Lcom/mygames/vgzseabattle/ac;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/RegisterApp;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/RegisterApp;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/ac;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ac;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Lcom/mygames/vgzseabattle/RegisterApp;Z)V

    new-instance v0, Lcom/mygames/vgzseabattle/y;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/y;-><init>()V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ac;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/ac;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v2}, Lcom/mygames/vgzseabattle/RegisterApp;->e(Lcom/mygames/vgzseabattle/RegisterApp;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/mygames/vgzseabattle/ac;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v3}, Lcom/mygames/vgzseabattle/RegisterApp;->f(Lcom/mygames/vgzseabattle/RegisterApp;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mygames/vgzseabattle/y;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Lcom/mygames/vgzseabattle/RegisterApp;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ac;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/RegisterApp;->g(Lcom/mygames/vgzseabattle/RegisterApp;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/ac;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Lcom/mygames/vgzseabattle/RegisterApp;)I

    move-result v1

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method
