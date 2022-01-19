<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<t:template>
	<jsp:attribute name="content">
		<h1>Fonctionnement des EPGP</h1>
		<p>EPGP, pour Effort Point et Gain Point.</p>
		<h2>GP</h2>
		<p>Les GP comptabilise la valeur des objets aquis par le perssonnage. 
		Cette valeur est fonction de l'ilvl de l'objet et du slot. On peu bien sur modifier cette règle de calcul.</p>
		<table class="pure-table pure-table-horizontal pure-table-striped">
			<thead>
				<tr>
					<th>Slot</th><th>regle de calcul</th><th>Exemple</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Arme à une main</td><td>ilvl*ilvl*0.42</td><td>Epée trempée chromatiquement 77*77*0.42 = 2490</td>
				</tr>
				<tr>
					<td>Arme à distance</td><td>ilvl*ilvl*0.42</td><td>Ashjre'thul, arbalète de châtiment 77*77*0.42 = 2490</td>
				</tr>
				<tr>
					<td>Baguette</td><td>ilvl*ilvl*0.42</td><td>Récolteur d'essence 70*70*0.42 = 2058</td>
				</tr>
				<tr>
					<td>Anneau</td><td>ilvl*ilvl*0.55</td><td>Anneau d'élémentium Pur 83*83*0.55 = 3788</td>
				</tr>
				<tr>
					<td>Bouclier</td><td>ilvl*ilvl*0.55</td><td>Bouclier en élémentium renforcé 77*77*0.55 = 3260</td>
				</tr>
				<tr>
					<td>Bracelet</td><td>ilvl*ilvl*0.55</td><td>Brassards de précision des arcanes 75*75*0.55 = 3093</td>
				</tr>
				<tr>
					<td>Cape</td><td>ilvl*ilvl*0.55</td><td>Cape brochée d'élémentium 77*77*0.55 = 3260</td>
				</tr>
				<tr>
					<td>Collier</td><td>ilvl*ilvl*0.55</td><td>Talisman de perfidie de Prestor 83*83*0.55 = 3788</td>
				</tr>
				<tr>
					<td>Main gauche</td><td>ilvl*ilvl*0.55</td><td>TODO</td>
				</tr>
				<tr>
					<td>Bijou</td><td>ilvl*ilvl*0.7</td><td>Larme de Neltharion 83*83*0.7 = 4822</td>
				</tr>
				<tr>
					<td>Botte</td><td>ilvl*ilvl*0.777</td><td>Bottes Chromatiques 77*77*0.777 = 4606</td>
				</tr>
				<tr>
					<td>Ceinture</td><td>ilvl*ilvl*0.777</td><td>Ceinture T2 77*77*0.777 = 4606</td>
				</tr>
				<tr>
					<td>Epauliere</td><td>ilvl*ilvl*0.777</td><td>Espauliers griffe-de-drake 75*75*0.777 = 4370</td>
				</tr>
				<tr>
					<td>Gant</td><td>ilvl*ilvl*0.777</td><td>Gant T2 76*76*0.777 = 4487</td>
				</tr>
				<tr>
					<td>Arme à deux mains</td><td>ilvl*ilvl*1</td><td>Baton de la flamme d'ombre 81*81*1 = 6561</td>
				</tr>
				<tr>
					<td>Casque</td><td>ilvl*ilvl*1</td><td>Mish'undare, coiffure du flagelleur mental 83*83*1 = 6889</td>
				</tr>
				<tr>
					<td>Jambiere</td><td>ilvl*ilvl*1</td><td>Jambière Surpuissante T2 77*77*1 = 5929</td>
				</tr>
				<tr>
					<td>Torse</td><td>ilvl*ilvl*1</td><td>Torse T2 76*76*1 = 5776</td>
				</tr>
			</tbody>
		</table>
		<p>Seulement les objets obtenu en MainStuff ou sur WishList sont comptabilisé.</p>
		<p>Certain objet sont très convoité, et parfois très rare, dans ce cas un coefficiens multiplicateur 
		est appliqué à la valeur précedente.</p>
		<p>Au contraire certain objet sont nul, dans ce cas un coéfficiens diviseur est appliqué à la valeur précédente.</p>
		<p>Les objets obtenu en OS (Other Spe, Other Stuff, +2) ne compte pas et valent 0</p>
		<p><em>(En cours de dev)</em> Les objets obtenu en WL sont majoré de 25%.</p>
		<h2>EP</h2>
			<p>Les EP sont les points d'éffort fourni par les joueurs, il existe plusieurs méthode pour les comptabiliser.
			Ici le mode choisit est de prendre la valeur en GP des objets lootés dans le raid, de diviser par le nombre de joueur présent.</p>
			<p>Par exemple dans un raid de 10 personne, 2 items sont attribué en MS, la CTS à 2490 et le Baton de la flamme d'ombre à 6561.
			Le raid a donc une valeur en EP de 2490 + 6561 = 9051. Chaque raideur gagne donc 9051/10 = 905 EP.</p>
			<p>em>(En cours de dev)</em>  Cependant une tel valeur de calcul n'ai pas egal pour tous les raids, 
			en effet une soiréee "try en boucle sur un boss" aurait une valeur de 0, ce qui n'est pas encourageant. 
			Donc la valeur d'EP, d'un raid est donc la valeur moyenne d'un raid du même type.</p>
			<p>Exemple si avec la regle de calcul précedente, sur un MC le raid gagnerai 10000 et sur un autre 20000, 
			dans les fait chaque MC raporte 15000 a l'ensemble du raid. 
			Donc si un joueur est present qu'au raid de "try" avec cette regle de calcul il est avantagé 
			par rapport à la précédente, et un joueur ne venant qu'au raid de "farm" est désavantagé.</p>
			<p>Un joueur bench <i class="fa fa-university" aria-hidden="true"></i>, gagne autant d'EP qu'un joueur séléctionné.</p>
			<p>Un joueur absent <i class="fa fa-eye-slash" aria-hidden="true"></i>, pert 50% des point qu'il aurait du gagné si il avait été présent.</p>
			<p>Un joueur quittant le raid avant le raid-off <i class="fa fa-sign-out" aria-hidden="true"></i>, ne gagne que 80% des points qu'il aurait du gagner.</p>
		<h2>Dépréciation</h2>
		<p>Les EPGP, ont une dépréciation de 10% par semaine.</p>
		<h1>List des Objects</h1>
		<table class="pure-table pure-table-striped">
			<c:forEach items="${itemss}" var="items">
				<thead>
					<tr><th colspan="4">${items[0].raid}</th></tr>
					<tr><th>Object</th><th>Point</th><th>ilvl</th><th>coef</th></tr>
				</thead>
				<tbody>
					<c:forEach items="${items}" var="i">
						<tr>
							<td><t:wowhead item="${i}"/> ${i.name}</td>
							<td>${i.pt}</td>
							<td>${i.ilvl}</td>
							<td><c:if test="${i.ptRatio != 100}">${i.ptRatio} %</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</c:forEach>
		</table>
	</jsp:attribute>
</t:template>