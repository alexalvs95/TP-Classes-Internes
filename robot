package tp.classesinternes;

public class Robot {

    private String nom;
    private boolean allume = false;
    private int energie;

    public Robot(String nom, int energie) {
        this.nom = nom;
        this.energie = Math.max(0, Math.min(100, energie));
    }

    public void allumer() {
        allume = true;
        System.out.println(nom + " est allumé.");
    }

    public void eteindre() {
        allume = false;
        System.out.println(nom + " est éteint.");
    }

    public Bras getBras() {
        return new Bras();
    }

    class Bras {

        public void saisir(String objet) {
            if (!allume) {
                System.out.println("[Bras] Impossible de saisir : " + nom + " est éteint.");
                return;
            }
            if (energie <= 20) {
                System.out.println("[Bras] Énergie insuffisante pour saisir " + objet + " (énergie : " + energie + ").");
                return;
            }
            energie -= 10;
            System.out.println("[Bras] " + nom + " saisit " + objet + ". Énergie restante : " + energie);
        }

        public void deposer(String objet) {
            if (!allume) {
                System.out.println("[Bras] Impossible de déposer : " + nom + " est éteint.");
                return;
            }
            energie -= 5;
            System.out.println("[Bras] " + nom + " dépose " + objet + ". Énergie restante : " + energie);
        }

        public void afficherEtat() {
            System.out.println("Robot : " + nom
                    + " | État : " + (allume ? "allumé" : "éteint")
                    + " | Énergie : " + energie);
        }
    }

    public static void main(String[] args) {
        Robot robot = new Robot("R2D2", 80);
        Bras bras = robot.getBras();

        System.out.println("=== Tentative avant allumage ===");
        bras.saisir("boulon");

        System.out.println("\n=== Allumage du robot ===");
        robot.allumer();
        bras.afficherEtat();

        System.out.println("\n=== Opérations ===");
        bras.saisir("boulon");
        bras.saisir("plaque");
        bras.deposer("boulon");
        bras.afficherEtat();

        System.out.println("\n=== Extinction ===");
        robot.eteindre();
        bras.deposer("plaque");
    }
}
