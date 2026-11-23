.class Lcom/mygames/vgzseabattle/af;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/RegisterApp;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/RegisterApp;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/af;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    new-instance v0, Lcom/mygames/vgzseabattle/y;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/y;-><init>()V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/af;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    iget-object v2, p0, Lcom/mygames/vgzseabattle/af;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v2}, Lcom/mygames/vgzseabattle/RegisterApp;->e(Lcom/mygames/vgzseabattle/RegisterApp;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/mygames/vgzseabattle/y;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Lcom/mygames/vgzseabattle/RegisterApp;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/af;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v0}, Lcom/mygames/vgzseabattle/RegisterApp;->g(Lcom/mygames/vgzseabattle/RegisterApp;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/mygames/vgzseabattle/af;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/RegisterApp;->c(Lcom/mygames/vgzseabattle/RegisterApp;)I

    move-result v1

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method
