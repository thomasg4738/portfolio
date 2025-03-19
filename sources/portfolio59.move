module portfolio::portfolio59;

use portfolio::asset::{Asset, new_asset};
use sui::coin::{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn};
use sui::url::Url;

public struct Portfolio59<phantom T, phantom C0, phantom C1, phantom C2, phantom C3, phantom C4, phantom C5, phantom C6, phantom C7, phantom C8, phantom C9, phantom C10, phantom C11, phantom C12, phantom C13, phantom C14, phantom C15, phantom C16, phantom C17, phantom C18, phantom C19, phantom C20, phantom C21, phantom C22, phantom C23, phantom C24, phantom C25, phantom C26, phantom C27, phantom C28, phantom C29, phantom C30, phantom C31, phantom C32, phantom C33, phantom C34, phantom C35, phantom C36, phantom C37, phantom C38, phantom C39, phantom C40, phantom C41, phantom C42, phantom C43, phantom C44, phantom C45, phantom C46, phantom C47, phantom C48, phantom C49, phantom C50, phantom C51, phantom C52, phantom C53, phantom C54, phantom C55, phantom C56, phantom C57, phantom C58> has key, store {
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
    asset40: Asset<C40>,
    asset41: Asset<C41>,
    asset42: Asset<C42>,
    asset43: Asset<C43>,
    asset44: Asset<C44>,
    asset45: Asset<C45>,
    asset46: Asset<C46>,
    asset47: Asset<C47>,
    asset48: Asset<C48>,
    asset49: Asset<C49>,
    asset50: Asset<C50>,
    asset51: Asset<C51>,
    asset52: Asset<C52>,
    asset53: Asset<C53>,
    asset54: Asset<C54>,
    asset55: Asset<C55>,
    asset56: Asset<C56>,
    asset57: Asset<C57>,
    asset58: Asset<C58>,
}

public fun create_portfolio59<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58>(
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
    amount40: u64,
    amount41: u64,
    amount42: u64,
    amount43: u64,
    amount44: u64,
    amount45: u64,
    amount46: u64,
    amount47: u64,
    amount48: u64,
    amount49: u64,
    amount50: u64,
    amount51: u64,
    amount52: u64,
    amount53: u64,
    amount54: u64,
    amount55: u64,
    amount56: u64,
    amount57: u64,
    amount58: u64,
    decimals: u8,
    name: vector<u8>,
    symbol: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
): (Portfolio59<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58>, CoinMetadata<T>) {
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
        Portfolio59 {
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
            asset40: new_asset<C40>(amount40),
            asset41: new_asset<C41>(amount41),
            asset42: new_asset<C42>(amount42),
            asset43: new_asset<C43>(amount43),
            asset44: new_asset<C44>(amount44),
            asset45: new_asset<C45>(amount45),
            asset46: new_asset<C46>(amount46),
            asset47: new_asset<C47>(amount47),
            asset48: new_asset<C48>(amount48),
            asset49: new_asset<C49>(amount49),
            asset50: new_asset<C50>(amount50),
            asset51: new_asset<C51>(amount51),
            asset52: new_asset<C52>(amount52),
            asset53: new_asset<C53>(amount53),
            asset54: new_asset<C54>(amount54),
            asset55: new_asset<C55>(amount55),
            asset56: new_asset<C56>(amount56),
            asset57: new_asset<C57>(amount57),
            asset58: new_asset<C58>(amount58),
        },
        c,
    )
}

public fun mint_portfolio59<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58>(
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
    input_coin40: Coin<C40>,
    input_coin41: Coin<C41>,
    input_coin42: Coin<C42>,
    input_coin43: Coin<C43>,
    input_coin44: Coin<C44>,
    input_coin45: Coin<C45>,
    input_coin46: Coin<C46>,
    input_coin47: Coin<C47>,
    input_coin48: Coin<C48>,
    input_coin49: Coin<C49>,
    input_coin50: Coin<C50>,
    input_coin51: Coin<C51>,
    input_coin52: Coin<C52>,
    input_coin53: Coin<C53>,
    input_coin54: Coin<C54>,
    input_coin55: Coin<C55>,
    input_coin56: Coin<C56>,
    input_coin57: Coin<C57>,
    input_coin58: Coin<C58>,
    portfolio: &mut Portfolio59<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58>,
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
    portfolio.asset40.deposit(input_coin40, amount);
    portfolio.asset41.deposit(input_coin41, amount);
    portfolio.asset42.deposit(input_coin42, amount);
    portfolio.asset43.deposit(input_coin43, amount);
    portfolio.asset44.deposit(input_coin44, amount);
    portfolio.asset45.deposit(input_coin45, amount);
    portfolio.asset46.deposit(input_coin46, amount);
    portfolio.asset47.deposit(input_coin47, amount);
    portfolio.asset48.deposit(input_coin48, amount);
    portfolio.asset49.deposit(input_coin49, amount);
    portfolio.asset50.deposit(input_coin50, amount);
    portfolio.asset51.deposit(input_coin51, amount);
    portfolio.asset52.deposit(input_coin52, amount);
    portfolio.asset53.deposit(input_coin53, amount);
    portfolio.asset54.deposit(input_coin54, amount);
    portfolio.asset55.deposit(input_coin55, amount);
    portfolio.asset56.deposit(input_coin56, amount);
    portfolio.asset57.deposit(input_coin57, amount);
    portfolio.asset58.deposit(input_coin58, amount);

    mint(&mut portfolio.treasury_cap, amount, ctx)
}

public fun burn_portfolio59<T: drop, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58>(
    portfolio_coin: Coin<T>,
    portfolio: &mut Portfolio59<T, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58>,
    ctx: &mut TxContext,
): (Coin<C0>, Coin<C1>, Coin<C2>, Coin<C3>, Coin<C4>, Coin<C5>, Coin<C6>, Coin<C7>, Coin<C8>, Coin<C9>, Coin<C10>, Coin<C11>, Coin<C12>, Coin<C13>, Coin<C14>, Coin<C15>, Coin<C16>, Coin<C17>, Coin<C18>, Coin<C19>, Coin<C20>, Coin<C21>, Coin<C22>, Coin<C23>, Coin<C24>, Coin<C25>, Coin<C26>, Coin<C27>, Coin<C28>, Coin<C29>, Coin<C30>, Coin<C31>, Coin<C32>, Coin<C33>, Coin<C34>, Coin<C35>, Coin<C36>, Coin<C37>, Coin<C38>, Coin<C39>, Coin<C40>, Coin<C41>, Coin<C42>, Coin<C43>, Coin<C44>, Coin<C45>, Coin<C46>, Coin<C47>, Coin<C48>, Coin<C49>, Coin<C50>, Coin<C51>, Coin<C52>, Coin<C53>, Coin<C54>, Coin<C55>, Coin<C56>, Coin<C57>, Coin<C58>) {
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
        portfolio.asset40.withdraw(amount, ctx),
        portfolio.asset41.withdraw(amount, ctx),
        portfolio.asset42.withdraw(amount, ctx),
        portfolio.asset43.withdraw(amount, ctx),
        portfolio.asset44.withdraw(amount, ctx),
        portfolio.asset45.withdraw(amount, ctx),
        portfolio.asset46.withdraw(amount, ctx),
        portfolio.asset47.withdraw(amount, ctx),
        portfolio.asset48.withdraw(amount, ctx),
        portfolio.asset49.withdraw(amount, ctx),
        portfolio.asset50.withdraw(amount, ctx),
        portfolio.asset51.withdraw(amount, ctx),
        portfolio.asset52.withdraw(amount, ctx),
        portfolio.asset53.withdraw(amount, ctx),
        portfolio.asset54.withdraw(amount, ctx),
        portfolio.asset55.withdraw(amount, ctx),
        portfolio.asset56.withdraw(amount, ctx),
        portfolio.asset57.withdraw(amount, ctx),
        portfolio.asset58.withdraw(amount, ctx),
    )
}

