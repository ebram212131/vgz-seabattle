.class Lcom/mygames/vgzseabattle/u;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/mygames/vgzseabattle/MainActivity;


# direct methods
.method constructor <init>(Lcom/mygames/vgzseabattle/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/mygames/vgzseabattle/u;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object v0, p0, Lcom/mygames/vgzseabattle/u;->a:Lcom/mygames/vgzseabattle/MainActivity;

    invoke-virtual {v0}, Lcom/mygames/vgzseabattle/MainActivity;->finish()V

    return-void
.end method
