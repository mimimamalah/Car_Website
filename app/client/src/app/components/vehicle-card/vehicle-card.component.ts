import { Component, Input } from '@angular/core';
import { Vehicle } from 'src/app/interfaces/vehicle';

@Component({
  selector: 'app-vehicle-card',
  templateUrl: './vehicle-card.component.html',
  styleUrls: ['./vehicle-card.component.css']
})
export class VehicleCardComponent {
  @Input() vehicle: Vehicle;
  
  stars: number[];

  constructor() {}

  ngOnInit(): void {
      this.stars = Array.from({ length: this.vehicle.rating });
  }
  
  getRatingArray(rating: number): number[] {
    return Array.from({ length: rating }, (_, index) => index + 1);
  }

  setImageSrc(marque: string): string[] {
    switch (marque) {
      case "Bugatti":
        return [
            "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/03/2018-Bugatti-Chiron-119.jpg?crop=1xw:1xh;center,center&resize=480:*",
            "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/03/2018-Bugatti-Chiron-117.jpg?crop=1xw:1xh;center,center&resize=480:*"
        ];
      case "Mercedes":
          return [
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/09/2018-Mercedes-AMG-GT-GTC-116.jpg?crop=1xw:1xh;center,center&resize=480:*",
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/09/2018-Mercedes-AMG-GT-GTC-114.jpg?crop=1xw:1xh;center,center&resize=480:*"
          ];
      case "Lamborghini":
          return [
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg?crop=1xw:1xh;center,center&resize=480:*",
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg?crop=1xw:1xh;center,center&resize=480:*"
          ];
      case "Ferrari":
          return [
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/06/2018-Ferrari-812-Superfast-115.jpg?crop=1xw:1xh;center,center&resize=480:*",
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/06/2018-Ferrari-812-Superfast-101.jpg?crop=1xw:1xh;center,center&resize=480:*"
          ];
      case "McLaren":
          return [
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/05/2018-McLaren-720S-105.jpg?crop=1xw:1xh;center,center&resize=480:*",
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/05/2018-McLaren-720S-101.jpg?crop=1xw:1xh;center,center&resize=480:*"
          ];
      case "Porsche":
          return [
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/04/2018-Porsche-911-GT3-103.jpg?crop=1xw:1xh;center,center&resize=480:*",
              "https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2017/05/2018-porsche-911-gt3-102.jpg?crop=1xw:1xh;center,center&resize=480:*"
          ];
        case "Honda":
            return [
                "https://www.legrandplateau.com/wp-content/uploads/2022/03/honda-confirme-la-presentation-de-la-nouvelle-honda-civic-type-r.jpg.webp?crop=1xw:1xh;center,center&resize=480:*",
                "https://hips.hearstapps.com/hmg-prod/images/2023-lightning-lap-honda-civic-type-r-mu-102-1675451016.jpg?crop=1xw:1xh;center,center&resize=480:*",
              ];
        case "Ford":
            return [
                "https://image-prod.iol.co.za/16x9/800/?source=https://xlibris.public.prod.oc.inl.infomaker.io:8443/opencontent/objects/bc9857a5-3b83-5610-aa80-8612e695f71c&operation=CROP&offset=95x286&resize=1532x862",
                "https://www.autocar.co.uk/sites/autocar.co.uk/files/images/car-reviews/first-drives/legacy/1-ford-ranger-stormtrak-2022-uk-first-drive-review-tracking-front.jpg?crop=1xw:1xh;center,center&resize=480:*"
            ];
        case "Volkswagen":
            return [
                "https://www.automobile-magazine.fr/asset/cms/212461/config/159875/volkswagen-touran-arriere.jpg",
                "https://uploads.vw-mms.de/system/production/images/vwn/076/033/images/e0af0ed5e526ed51bca94451cabdd6f5f6427a3b/DB2023AU00267_web_1600.jpg?crop=1xw:1xh;center,center&resize=480:*"
            ];
        case "Tesla":
            return [
                "https://example.com/tesla-image-1.jpg",
                "https://example.com/tesla-image-2.jpg"
            ];
        case "Nissan":
            return [
                "https://example.com/nissan-image-1.jpg",
                "https://example.com/nissan-image-2.jpg"
            ];
        default:
            return ["", ""];
    }
  }
  
}