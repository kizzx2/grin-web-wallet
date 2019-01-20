import { Component, OnInit } from '@angular/core';
import { WalletService} from '../../../services/wallet.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {
  readonly readonlyWallet = APP_CONFIG.WALLET_READONLY;

  constructor(public walletService: WalletService) { }

  ngOnInit() {
  }

}
