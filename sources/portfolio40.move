module portfolio::portfolio40;

use portfolio::asset::{Asset, new_asset};
use sui::coin::{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn};
use sui::url::Url;

public struct Portfolio40<phantom T, phantom C0, phantom C1, phantom C2, phantom C3, phantom C4, phantom C5, phantom C6, phantom C7, phantom C8, phantom C9, phantom C10, phantom C11, phantom C12, phantom C13, phantom C14, phantom C15, phantom C16, phantom C17, phantom C18, phantom C19, phantom C20, phantom C21, phantom C22, phantom C23, phantom C24, phantom C25, phantom C26, phantom C27, phantom C28, phantom C29, phantom C30, phantom C31, phantom C32, phantom C33, phantom C34, phantom C35, phantom C36, phantom C37, phantom C38, phantom C39> has key, store {
    id: UID,
    treasury_cap: TreasuryCap<T>,
    asset0: Asset<C0>,
    asset1: Asset<C1>,
    asset2: Asset<C2>,
    asset3: Asset<C3>,
    asset4: Asset<C4>,
    asset5: Asset<C5>,
    asset6: Asset<C6>,
    asset7: Asset<C7>,
    asset8: Asset<C8>,
    asset9: Asset<C9>,
    asset10: Asset<C10>,
    asset11: Asset<C11>,
    asset12: Asset<C12>,
    asset13: Asset<C13>,
    asset14: Asset<C14>,
    asset15: Asset<C15>,
    asset16: Asset<C16>,
    asset17: Asset<C17>,
    asset18: Asset<C18>,
    asset19: Asset<C19>,
    asset20: Asset<C20>,
    asset21: Asset<C21>,
    asset22: Asset<C22>,
    asset23: Asset<C23>,
    asset24: Asset<C24>,
    asset25: Asset<C25>,
    asset26: Asset<C26>,
    asset27: Asset<C27>,
    asset28: Asset<C28>,
    asset29: Asset<C29>,
    asset30: Asset<C30>,
    asset31: Asset<C31>,
    asset32: Asset<C32>,
    asset33: Asset<C33>,
    asset34: Asset<C34>,
    asset35: Asset<C35>,
    asset36: Asset<C36>,
    asset37: Asset<C37>,
    asset38: Asset<C38>,
    asset39: Asset<C39>,
}

public fun create_portfolio40<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39>(
    witness: T,
    amount0: u64,
    amount1: u64,
    amount2: u64,
    amount3: u64,
    amount4: u64,
    amount5: u64,
    amount6: u64,
    amount7: u64,
    amount8: u64,
    amount9: u64,
    amount10: u64,
    amount11: u64,
    amount12: u64,
    amount13: u64,
    amount14: u64,
    amount15: u64,
    amount16: u64,
    amount17: u64,
    amount18: u64,
    amount19: u64,
    amount20: u64,
    amount21: u64,
    amount22: u64,
    amount23: u64,
    amount24: u64,
    amount25: u64,
    amount26: u64,
    amount27: u64,
    amount28: u64,
    amount29: u64,
    amount30: u64,
    amount31: u64,
    amount32: u64,
    amount33: u64,
    amount34: u64,
    amount35: u64,
    amount36: u64,
    amount37: u64,
    amount38: u64,
    amount39: u64,
    decimals: u8,
    name: vector<u8>,
    symbol: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
): (Portfolio40<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39>, CoinMetadata<T>) {
    let (treasury_cap, c) = create_currency(
        witness,
        decimals,
        symbol,
        name,
        description,
        icon_url,
        ctx
    );
    (
        Portfolio40 {
            id: object::new(ctx),
            treasury_cap,
            asset0: new_asset<C0>(amount0),
            asset1: new_asset<C1>(amount1),
            asset2: new_asset<C2>(amount2),
            asset3: new_asset<C3>(amount3),
            asset4: new_asset<C4>(amount4),
            asset5: new_asset<C5>(amount5),
            asset6: new_asset<C6>(amount6),
            asset7: new_asset<C7>(amount7),
            asset8: new_asset<C8>(amount8),
            asset9: new_asset<C9>(amount9),
            asset10: new_asset<C10>(amount10),
            asset11: new_asset<C11>(amount11),
            asset12: new_asset<C12>(amount12),
            asset13: new_asset<C13>(amount13),
            asset14: new_asset<C14>(amount14),
            asset15: new_asset<C15>(amount15),
            asset16: new_asset<C16>(amount16),
            asset17: new_asset<C17>(amount17),
            asset18: new_asset<C18>(amount18),
            asset19: new_asset<C19>(amount19),
            asset20: new_asset<C20>(amount20),
            asset21: new_asset<C21>(amount21),
            asset22: new_asset<C22>(amount22),
            asset23: new_asset<C23>(amount23),
            asset24: new_asset<C24>(amount24),
            asset25: new_asset<C25>(amount25),
            asset26: new_asset<C26>(amount26),
            asset27: new_asset<C27>(amount27),
            asset28: new_asset<C28>(amount28),
            asset29: new_asset<C29>(amount29),
            asset30: new_asset<C30>(amount30),
            asset31: new_asset<C31>(amount31),
            asset32: new_asset<C32>(amount32),
            asset33: new_asset<C33>(amount33),
            asset34: new_asset<C34>(amount34),
            asset35: new_asset<C35>(amount35),
            asset36: new_asset<C36>(amount36),
            asset37: new_asset<C37>(amount37),
            asset38: new_asset<C38>(amount38),
            asset39: new_asset<C39>(amount39),
        },
        c,
    )
}

public fun mint_portfolio40<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39>(
    input_coin0: Coin<C0>,
    input_coin1: Coin<C1>,
    input_coin2: Coin<C2>,
    input_coin3: Coin<C3>,
    input_coin4: Coin<C4>,
    input_coin5: Coin<C5>,
    input_coin6: Coin<C6>,
    input_coin7: Coin<C7>,
    input_coin8: Coin<C8>,
    input_coin9: Coin<C9>,
    input_coin10: Coin<C10>,
    input_coin11: Coin<C11>,
    input_coin12: Coin<C12>,
    input_coin13: Coin<C13>,
    input_coin14: Coin<C14>,
    input_coin15: Coin<C15>,
    input_coin16: Coin<C16>,
    input_coin17: Coin<C17>,
    input_coin18: Coin<C18>,
    input_coin19: Coin<C19>,
    input_coin20: Coin<C20>,
    input_coin21: Coin<C21>,
    input_coin22: Coin<C22>,
    input_coin23: Coin<C23>,
    input_coin24: Coin<C24>,
    input_coin25: Coin<C25>,
    input_coin26: Coin<C26>,
    input_coin27: Coin<C27>,
    input_coin28: Coin<C28>,
    input_coin29: Coin<C29>,
    input_coin30: Coin<C30>,
    input_coin31: Coin<C31>,
    input_coin32: Coin<C32>,
    input_coin33: Coin<C33>,
    input_coin34: Coin<C34>,
    input_coin35: Coin<C35>,
    input_coin36: Coin<C36>,
    input_coin37: Coin<C37>,
    input_coin38: Coin<C38>,
    input_coin39: Coin<C39>,
    portfolio: &mut Portfolio40<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39>,
    amount: u64,
    ctx: &mut TxContext,
): Coin<T> {
    portfolio.asset0.deposit(input_coin0, amount);
    portfolio.asset1.deposit(input_coin1, amount);
    portfolio.asset2.deposit(input_coin2, amount);
    portfolio.asset3.deposit(input_coin3, amount);
    portfolio.asset4.deposit(input_coin4, amount);
    portfolio.asset5.deposit(input_coin5, amount);
    portfolio.asset6.deposit(input_coin6, amount);
    portfolio.asset7.deposit(input_coin7, amount);
    portfolio.asset8.deposit(input_coin8, amount);
    portfolio.asset9.deposit(input_coin9, amount);
    portfolio.asset10.deposit(input_coin10, amount);
    portfolio.asset11.deposit(input_coin11, amount);
    portfolio.asset12.deposit(input_coin12, amount);
    portfolio.asset13.deposit(input_coin13, amount);
    portfolio.asset14.deposit(input_coin14, amount);
    portfolio.asset15.deposit(input_coin15, amount);
    portfolio.asset16.deposit(input_coin16, amount);
    portfolio.asset17.deposit(input_coin17, amount);
    portfolio.asset18.deposit(input_coin18, amount);
    portfolio.asset19.deposit(input_coin19, amount);
    portfolio.asset20.deposit(input_coin20, amount);
    portfolio.asset21.deposit(input_coin21, amount);
    portfolio.asset22.deposit(input_coin22, amount);
    portfolio.asset23.deposit(input_coin23, amount);
    portfolio.asset24.deposit(input_coin24, amount);
    portfolio.asset25.deposit(input_coin25, amount);
    portfolio.asset26.deposit(input_coin26, amount);
    portfolio.asset27.deposit(input_coin27, amount);
    portfolio.asset28.deposit(input_coin28, amount);
    portfolio.asset29.deposit(input_coin29, amount);
    portfolio.asset30.deposit(input_coin30, amount);
    portfolio.asset31.deposit(input_coin31, amount);
    portfolio.asset32.deposit(input_coin32, amount);
    portfolio.asset33.deposit(input_coin33, amount);
    portfolio.asset34.deposit(input_coin34, amount);
    portfolio.asset35.deposit(input_coin35, amount);
    portfolio.asset36.deposit(input_coin36, amount);
    portfolio.asset37.deposit(input_coin37, amount);
    portfolio.asset38.deposit(input_coin38, amount);
    portfolio.asset39.deposit(input_coin39, amount);

    mint(&mut portfolio.treasury_cap, amount, ctx)
}

public fun burn_portfolio40<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39>(
    portfolio_coin: Coin<T>,
    portfolio: &mut Portfolio40<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39>,
    ctx: &mut TxContext,
): (Coin<C0>, Coin<C1>, Coin<C2>, Coin<C3>, Coin<C4>, Coin<C5>, Coin<C6>, Coin<C7>, Coin<C8>, Coin<C9>, Coin<C10>, Coin<C11>, Coin<C12>, Coin<C13>, Coin<C14>, Coin<C15>, Coin<C16>, Coin<C17>, Coin<C18>, Coin<C19>, Coin<C20>, Coin<C21>, Coin<C22>, Coin<C23>, Coin<C24>, Coin<C25>, Coin<C26>, Coin<C27>, Coin<C28>, Coin<C29>, Coin<C30>, Coin<C31>, Coin<C32>, Coin<C33>, Coin<C34>, Coin<C35>, Coin<C36>, Coin<C37>, Coin<C38>, Coin<C39>) {
    let amount = portfolio_coin.value();
    burn(&mut portfolio.treasury_cap, portfolio_coin);

    (
        portfolio.asset0.withdraw(amount, ctx),
        portfolio.asset1.withdraw(amount, ctx),
        portfolio.asset2.withdraw(amount, ctx),
        portfolio.asset3.withdraw(amount, ctx),
        portfolio.asset4.withdraw(amount, ctx),
        portfolio.asset5.withdraw(amount, ctx),
        portfolio.asset6.withdraw(amount, ctx),
        portfolio.asset7.withdraw(amount, ctx),
        portfolio.asset8.withdraw(amount, ctx),
        portfolio.asset9.withdraw(amount, ctx),
        portfolio.asset10.withdraw(amount, ctx),
        portfolio.asset11.withdraw(amount, ctx),
        portfolio.asset12.withdraw(amount, ctx),
        portfolio.asset13.withdraw(amount, ctx),
        portfolio.asset14.withdraw(amount, ctx),
        portfolio.asset15.withdraw(amount, ctx),
        portfolio.asset16.withdraw(amount, ctx),
        portfolio.asset17.withdraw(amount, ctx),
        portfolio.asset18.withdraw(amount, ctx),
        portfolio.asset19.withdraw(amount, ctx),
        portfolio.asset20.withdraw(amount, ctx),
        portfolio.asset21.withdraw(amount, ctx),
        portfolio.asset22.withdraw(amount, ctx),
        portfolio.asset23.withdraw(amount, ctx),
        portfolio.asset24.withdraw(amount, ctx),
        portfolio.asset25.withdraw(amount, ctx),
        portfolio.asset26.withdraw(amount, ctx),
        portfolio.asset27.withdraw(amount, ctx),
        portfolio.asset28.withdraw(amount, ctx),
        portfolio.asset29.withdraw(amount, ctx),
        portfolio.asset30.withdraw(amount, ctx),
        portfolio.asset31.withdraw(amount, ctx),
        portfolio.asset32.withdraw(amount, ctx),
        portfolio.asset33.withdraw(amount, ctx),
        portfolio.asset34.withdraw(amount, ctx),
        portfolio.asset35.withdraw(amount, ctx),
        portfolio.asset36.withdraw(amount, ctx),
        portfolio.asset37.withdraw(amount, ctx),
        portfolio.asset38.withdraw(amount, ctx),
        portfolio.asset39.withdraw(amount, ctx),
    )
}

