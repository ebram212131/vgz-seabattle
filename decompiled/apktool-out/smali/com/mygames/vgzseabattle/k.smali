.class Lcom/mygames/vgzseabattle/k;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/ActivityMenu;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/ActivityMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/k;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    new-instance v0, Lcom/mygames/vgzseabattle/y;

    invoke-direct {v0}, Lcom/mygames/vgzseabattle/y;-><init>()V

    iget-object v1, p0, Lcom/mygames/vgzseabattle/k;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->n(Lcom/mygames/vgzseabattle/ActivityMenu;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/y;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1000*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const-string v0, ""

    :goto_0
    return-void

    :cond_0
    const-string v1, "1000*"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/mygames/vgzseabattle/aa;

    invoke-direct {v1}, Lcom/mygames/vgzseabattle/aa;-><init>()V

    iget-object v2, p0, Lcom/mygames/vgzseabattle/k;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v2}, Lcom/mygames/vgzseabattle/ActivityMenu;->o(Lcom/mygames/vgzseabattle/ActivityMenu;)I

    move-result v2

    const/4 v3, 0x0

    aget-object v3, v0, v3

    iget-object v4, p0, Lcom/mygames/vgzseabattle/k;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-static {v4}, Lcom/mygames/vgzseabattle/ActivityMenu;->o(Lcom/mygames/vgzseabattle/ActivityMenu;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    aget-object v0, v0, v4

    invoke-virtual {v1, v2, v3, v0}, Lcom/mygames/vgzseabattle/aa;->a(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/mygames/vgzseabattle/k;->a:Lcom/mygames/vgzseabattle/ActivityMenu;

    invoke-virtual {v0, v1}, Lcom/mygames/vgzseabattle/ActivityMenu;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
