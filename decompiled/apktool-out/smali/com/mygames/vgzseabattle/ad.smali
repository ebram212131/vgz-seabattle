.class Lcom/mygames/vgzseabattle/ad;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/RegisterApp;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/RegisterApp;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/ad;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/mygames/vgzseabattle/ad;->a:Lcom/mygames/vgzseabattle/RegisterApp;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mygames/vgzseabattle/RegisterApp;->a(Lcom/mygames/vgzseabattle/RegisterApp;Z)V

    return-void
.end method
